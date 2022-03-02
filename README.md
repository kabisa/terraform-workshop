# Terraform workshop

Welcome to the Terraform workshop. In this workshop we will set up a very simple
nginx web server that serves a static page. Some code is already present to get
you started, but you will need to finish it.

Before we get started, you should have received a team name and an AWS access
key from your instructor(s).

## Step 0 - Get this party started

First, we need to make sure you can apply the Terraform code. You will need to
do the following things:

1. Set up your AWS credentials. For this, you can use `aws configure` and use
   `aws sts get-caller-identity` to see you have configured your credentials
   correctly.
2. Copy the `user.auto.tfvars.example` file to `user.auto.tfvars`. We will use
   this file to store some variables specifically for your team. Configure your
   team name here.
3. To make sure you can SSH into the machines when necessary, set up a
   public/private key pair. You can use `ssh-keygen -t ed25519 -f
   ~/.ssh/id_ec2` to create a new key pair. Copy the contents of
   `~/.ssh/id_ec2.pub` into the public key value in `user.auto.tfvars`.
4. SSH is only available from whitelisted IPs. Get your public IP and add it to
   the `ssh_cidr_blocks` in the same file. Use the CIDR notation
   (`127.0.0.1/32`).

You should now be all set. First, run `terraform init` and then `terraform
apply` to create the basic infrastructure.

## Step 1 - Allow inbound traffic

You should now have a single EC2 instance running nginx, which will serve a
simple web page. At this moment, we can not reach it yet. We need an Elastic IP
attached to the machine to see the page. The security group also does not allow
inbound traffic on port 80 yet. Update your infrastructure in Terraform to make
this work.

Hint: you can see the Elastic IP you created by adding an output block.

## Step 2 - Multiple EC2-instances

Your application is bound to become very popular. We can't expect one EC2
instance to handle all traffic forever. In this step, we are going to add a
second EC2 instance to handle more traffic.

1. Let's make sure there are two EC2 instances. Try to do this without
   duplicating the resource block. We might want to add more instances later.
2. Make sure you add an index or something else to the file created in the user
   data of the EC2 instance. This way you can distinguish the two instances when
   you see the page.
3. You will need an Elastic IP for each EC2 instance. Don't worry about having
   a single entry point for both machines for now. We will add that in the next
   step.

Hint: You can use the `count` and `for_each` meta-attributes to create multiple
instances of a resource.

Hint: changing the user data of an EC2 instance resource has no effect on
existing instances. You can always destroy your instance using `terraform
destroy -target=aws_instance.this`, and use `terraform apply` to recreate it.

## Step 3 - Load balancer

In this part, we are going to add an Application Load Balancer (ALB) to forward
traffic to your EC2 instances.

1. We no longer need the Elastic IPs if we use the load balancer. You can delete
   this resource.
2. We prefer to use a separate security group for the ALB. Create a security
   group with rules that allow ingress from the public internet and egress to
   the EC2 instances.
3. Create a load balancer, a target group and attach the EC2 instances to the
   target group. Add a load balancer listener that forwards all traffic to the
   target group.
4. Add the DNS name of your load balancer to the output to see the URL you can
   visit.
5. Stretch goal: we no longer need to support HTTP directly to the EC2 instance.
   Change the security group to only allow traffic from the EC2 instance.

Hint: You can use the public subnets created by the VPC module with this
expression: `module.vpc.public_subnets`.
