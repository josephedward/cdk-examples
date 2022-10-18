import 'source-map-support/register';
import * as cdk from '@aws-cdk/core';
import { EksPipelineStack } from '../lib/eks-pipeline-stack';

require('dotenv').config();

// console.log(process.env);

const app = new cdk.App();
new EksPipelineStack(app, 'EksPipelineStack', {
  env: { account: process.env.CDK_DEFAULT_ACCOUNT,
     region: process.env.CDK_DEFAULT_REGION },
});

app.synth()
