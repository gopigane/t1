#CLUSTER CREATION
resource "aws_eks_cluster" "eks-cluster"{
name = "eks-cluster"
role_arn = "${aws_iam_role.demo-cluster.arn}"
version = "1.22"

vpc_config {
 security_group_ids = ["${aws_security_group.ALL-TRAFFIC.id}"]
 subnet_ids = ["${aws_subnet.tera-sub-1.id}","${aws_subnet.tera-sub-2.id}"]
 }
 

depends_on = [
 aws_iam_role_policy_attachment.demo-cluster-AmaoznEKSClusterPolicy,
 aws_iam_role_policy_attachment.demo-cluster-AmazonEKSVPCResourceController,
 
 ]
 
 }
