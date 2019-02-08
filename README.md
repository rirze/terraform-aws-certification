# AWS Examples using Terraform
## Motivations
* Learn Terraform
* Minimize Creation Time
* Minimize Destruction Time
## Outline (of Projects)

### Chapter 3
#### Simple HTTP Server (apacheserver)
Sets up a t2.micro instance of Amazon Linux 2, opens up incoming traffic to port 80 for HTTP, and installs Apache server showing a simple webpage that displays the IP of the instance.
### Chapter 4
#### Using an Application Load Balancer for just one Instance (naivealb)
To anyone who understands what load balancers are, this example doesn't make any sense: the purpose of load balancers is use multiple instances. With that in mind, this is a simple demonstration of how to setup an application load balancer. This example is not practical and is only useful for showing how to setup a load balancer.
#### Using an Application Load Balancer with a Launch Configuration (alb)
This is the recommended way of setting up an application load balancer-- by configuring a `aws_launch_configuration` that launches multiple instances. Includes a `aws_autoscaling_group` for completeness.  