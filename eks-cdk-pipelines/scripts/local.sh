source .env
echo $token
aws secretsmanager create-secret --name token --description "Secret for GitHub" --secret-string "$token" || echo "token exists"                   
hostZone="aptnative.sandbox.hostzone.com"
HOSTED_ZONE_ID=$(aws route53 create-hosted-zone --name $hostZone  --caller-reference $(date +%s) --query 'HostedZone.Id') 
aws ssm put-parameter --name '/eks-cdk-pipelines/zoneName' --type String --value "$hostZone" 
aws ssm put-parameter --name '/eks-cdk-pipelines/hostZoneId' --type String --value "$HOSTED_ZONE_ID" 

