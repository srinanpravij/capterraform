# Vijayalakshmi Kuppuswamy
<h2>Capstone Project 2 - Provisioning and Monitoring</h2>
<h3>Design Document</h3>
<h3>
  <ol>
  <li>Capstone Project Technological Tool Stack:To build the python flask app using the DevOps approach in building production ready CI/CD pipeline,the tools we are going to use are listed below: </li>
   <ol>
     <li>Python</li>
      <li>Github: as a single source of truth</li>
      <li>Docker:</li>
     <ol>
       <li>Build the flask image</li>
     </ol>
      <li>Docker hub:</li>
     <ol>
       <li>To push the docker flask image as an artifact</li>
       <li>To pull the docker flask image from the artifact</li>
     </ol>
      <li>Jenkins: Jenkins is the heart of the entire CI/CD pipeline where we are going to:</li>
     <ol>
       <li>Build the image from Dockerfile.</li>
        <li>Push the image to the Docker-hub</li>
        <li>Declare our environment credentials for Jenkins to interact with the docker hub</li>
        <li>Perform a SVM checkout</li>
        <li>Build the project</li>
			 <li>Deploy the Kubernetes cluster using terraform</li>
     </ol>
      <li>Terraform: We are going to use terraform to provision the Kubernetes cluster</li>
		 <ol>
			 <li>Using a Kubernetes.tf  file we are going to set details of our deployment and service.</li>
			 <li>The docker hub repository and the flask application name that we are going to provision into our cluster</li>
			 <li>The number of repilicas of 3 flask app.</li>
			 <li>Terraform doesn't only create resources, it updates, and deletes tracked resources without requiring to inspect the API to identify those resource.</li>
					 </ol>
      <li>AWS: using AWS we are leveraging the cloud features:</li>
		 <ol>
			 <li>Creating EC-2 instances of our linux environments.</li>
			 <li>AWS instances will provide the complete environment to run our CI/CD pipeline.</li>
			 <li>Mobaxterm and PUTTY: using this tool we can ssh into our ec2 instances and    work into them.</li>
		 </ol>
		 <li>Virtual Box: using ubuntu 20.04 virtual box to run our entire end-to-end tool stack having our Jenkins pipline to integrate the build and deploy.</li>
		 <li>ELK (Elastic-Logstash-Kibana stack) : Setting and configuring the ELK stack to monitor our CPU, memory, Disk utilization along with our flask app.</li>
		 <li>Network monitoring tool: using htop to show the system utilizing and to compare with the ELK dashboard.</li>
		 <li>Stress tool: using the stress tool to induce load on the system and to monitor the changes we need to be alerted if the system exceeds 80% of utilization.</li>
   </ol>
</ol>
</h3>
<img src="https://github.com/srinanpravij/capterraform/blob/master/images/toolstack.png">
<h3>Flow Chart:</h3>
<img src="https://github.com/srinanpravij/capterraform/blob/master/images/flowchart.png">

<h2>Setting up the environment: </h2>
<h3>Set up a EC2 ubuntu 20.04 ami image, 
Installed the required tool stack: docker, docker-compose, jenkins, terraform, kubectl and terraform. At the jenkins we install all the needed plugins.</h3>

<h2>Using terrraform to proivide a kubernetes cluster </h2>
<img src="https://github.com/srinanpravij/capterraform/blob/master/images/terraform1.png">
<img src="https://github.com/srinanpravij/capterraform/blob/master/images/terraform2.png">
<img src="https://github.com/srinanpravij/capterraform/blob/master/images/terraform4.png">
<img src="https://github.com/srinanpravij/capterraform/blob/master/images/terraform5.png">
<img src="https://github.com/srinanpravij/capterraform/blob/master/images/terraform6.png">
<img src="https://github.com/srinanpravij/capterraform/blob/master/images/terraform7.png">


<h2>Implementing the pipeline:</h2>
<ol>
	<li> Create a new jenkin's pipeline and configuring the job with needed plugins, configuring the global tools and setting the credentials and evironnment variable for docker hub repo and terraform file. </li>
<li> Our pipeline will clean the workspace and checkout the source code from git.Then we use the environment settings to build and push the image to docker hub vijaya81kp/capterrapp</li> 
<li>  We use terraform to use the above mentioned image from the docker hub and using the kubernetes.tf we trigger the terraform init and terraform apply to provision our kubernetes cluster with the flask application into the kubeadm cluster tfflask</li> 
	</ol>

<img src="https://github.com/srinanpravij/capterraform/blob/master/images/jenkins1.png">
<img src="https://github.com/srinanpravij/capterraform/blob/master/images/jenkins2.png">

<h2>Deployment of the flask app on tfflask cluster:</h2>
<img src="https://github.com/srinanpravij/capterraform/blob/master/images/cluster1.png">
<img src="https://github.com/srinanpravij/capterraform/blob/master/images/cluster2.png">
<img src="https://github.com/srinanpravij/capterraform/blob/master/images/cluster3.png">
<img src="https://github.com/srinanpravij/capterraform/blob/master/images/cluster4png.png">

<h2>Monitoring</h2>
<h3>By default, whenever an EC2 instance is launched, AWS CloudWatch enables basic monitoring for that instance. The basic monitoring level collects monitoring data in 5 minute periods. ... With detailed monitoring, we can also get aggregated data across groups of similar EC2 instances.</h3>


<img src="https://github.com/srinanpravij/capterraform/blob/master/images/monitor1.png">

<img src="https://github.com/srinanpravij/capterraform/blob/master/images/monitor2.png">

<img src="https://github.com/srinanpravij/capterraform/blob/master/images/monitor3.png">

<img src="https://github.com/srinanpravij/capterraform/blob/master/images/monitor4.png">

<img src="https://github.com/srinanpravij/capterraform/blob/master/images/monitor5.png">

<img src="https://github.com/srinanpravij/capterraform/blob/master/images/monitor6.png">

<img src="https://github.com/srinanpravij/capterraform/blob/master/images/monitor7.png">

