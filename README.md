# zero-trust-pas
A set of configuration -- VM Extensions, Product Config, and Terraform -- for creating a zero trust PAS environment.

![Reference Diagram](https://raw.githubusercontent.com/azwickey-pivotal/zero-trust-pas/master/img/ref.png "Reference Diagram")


## Common Communications
#### Resources and Jobs
* All VMs

#### Inbound
| Port          | Source        | Target Resource | Comments | Transport Layer Protocol | App Layer Protocol | Security & Auth |
| ------------- | ------------- | --------------- | -------- | ------------------------ | ------------------ | ------------------- |
| 8853  | BOSH Director  | All  | BOSH DNS checks  | TCP  | HTTPS  | mTLS  |
| 4222  | BOSH Director  | All  | BOSH NATS  | xxx  | xxx  | xxx  |
| 8053  | BOSH Director  | All  |   | xxx  | xxx  | xxx  |

#### Outbound
| Port          | Target        | Source Resource | Comments | Transport Layer Protocol | App Layer Protocol | Security & Auth |
| ------------- | ------------- | --------------- | -------- | ------------------------ | ------------------ | ------------------- |
| 8853  | BOSH Director  | All  | BOSH DNS checks  | TCP  | HTTPS  | mTLS  |
| 8053  | BOSH Director  | All  |   | TCP  | HTTPS  | mTLS  |
| 6868  | BOSH Director  | All  | BOSH Agent Access  | xxx  | xxx  | xxx  |
| 4222  | BOSH Director  | All  | BOSH NATS  | xxx  | xxx  | xxx  |
| 25777  | BOSH Director  | All  | BOSH Registry  | xxx  | xxx  | xxx  |
| 443  | Amazon S3  | All  | S3 Endpoint Gateway  | TCP  | HTTPS  | OAuth 2.0  |
| 123  | AWS NTP  | All  | NTP Services  | UDP  | xxx  | xxx  |

![Reference Diagram](https://raw.githubusercontent.com/azwickey-pivotal/zero-trust-pas/master/img/common.png "Reference Diagram")
