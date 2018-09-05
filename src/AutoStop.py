
import boto3, os, datetime

def extract_tags(aws, key):
    ret = '-'
    if aws:
        for i in aws :
           if i['Key'] == key:
               if i['Value'] != "":
                   ret = i['Value']
               break
    return ret


def lambda_handler(event, context):
    filters_running = [
        {
            'Name': 'instance-state-name', 
            'Values': ['running']
        }
    ]
    filters_nottostop = [{
            'Name': 'tag:AutoStop',
            'Values': ['no']
        }
    ]
    
    client = boto3.client('ec2')
    regions = [region['RegionName'] for region in client.describe_regions()['Regions']]

    for r in regions:
        ec2 = boto3.resource('ec2', region_name=r)

        instances_running = ec2.instances.filter(Filters=filters_running)
        instances_nottostop = ec2.instances.filter(Filters=filters_nottostop)
        for ir in instances_running:
            name = extract_tags(ir.tags, "Name")
            if name:
                print ("Running instance : %s (%s) on region %s" % (name, ir.id, r))
            else:
                print ("Running instance : %s on region %s" % (ir.id, r))
            if ir not in instances_nottostop:
                if name:
                    print ("I will stop instance : %s (%s) on region %s" % (name, ir.id, r))
                else:
                    print ("I will stop instance : %s on region %s" % (ir.id, r))
                shuttingDown = ec2.instances.filter(InstanceIds=[ir.id]).stop()
    return
