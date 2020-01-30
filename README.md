# F5 Azure Government ARM Templates

[![Releases](https://img.shields.io/github/release/Mikej81/f5-azure-mag-arm-templates.svg)](https://github.com/Mikej81/f5-azure-mag-arm-templates/releases)
[![Issues](https://img.shields.io/github/issues/Mikej81/f5-azure-mag-arm-templates.svg)](https://github.com/Mikej81/f5-azure-mag-arm-templates/issues)

## Introduction

Welcome to the GitHub repository for F5's ARM templates for Azure deployments.  All of the templates in this repository have been developed by F5 Networks engineers. All templates in this repository are *experimental*.

## Template information

Descriptions for each template are contained at the top of each template in the *Description* key.
For additional information, including how the templates are generated, and assistance in deploying a template, see the individual README.md file in the individual template directory.

## Failover 
<br> These templates deploy more than one BIG-IP VE in a <a href="http://www.f5.com/pdf/white-papers/scalen-elastic-infrastructure-white-paper.pdf">ScaleN cluster</a> (a traditional High Availability Pair in most cases). Failover clusters are primarily used to replicate traditional Active/Standby BIG-IP deployments. <br>  
  In these deployments, an individual BIG-IP VE in the cluster owns (or is Active for) a particular IP address. For example, the BIG-IP VEs will fail over services from one instance to another by remapping IP addresses, routes, etc. based on Active/Standby status. In some solutions, failover is implemented via API (API calls to the cloud platform vs. network protocols like Gratuitous ARP, route updates, and so on). In other solutions, failover is implemented via an upstream service (like a native load balancer) which will only send traffic to the Active Instance for that service based on a health monitor. For more information, see the failover README files. In all cases, a single BIG-IP VE will be active for a single IP address.   <br>    
  Lifecycle:  These templates facilitate initial deployments only. Changing the version of BIG-IP in the template will cause a new BIG-IP image to be deployed and its configuration will have to be restored via traditional means. For example, if the instance has:
    
    * Single slot or BIG-IP was replaced/upgraded
      * Restore the BIG-IP VE backup [UCS](https://support.f5.com/csp/article/K13132) file.
      * Use external automation to completely re-configure and re-cluster
    * Multiple slots
      * In place via live installs from an available slot.<br>  
  
    Failover templates include same-net, where instances in the cluster are deployed on the same subnet (L3), and across-net where instances in cluster are deployed across L3 subnets.  

## Network Type
In our Failover templates, you have the following choices for the type of network in which you want to deploy the BIG-IP VE.  See the individual README files for specific requirements and information. Note that all options are not available in all templates.

  - **same-net** <br> In Same Network (same-net) templates, the instances in cluster are deployed on same subnet (L3).

  ## Stack Type
For each of the standalone templates, you must choose the type of stack into which you want to deploy the BIG-IP VE. See the individual README files for exact requirements.  Note that not all options are available for all templates. 

  - **New Stack** <br> These templates deploy BIG-IP instances into a new cloud network.  The required Azure virtual network and subnets will be created along with the deployment, and public IP addresses are created on all external Azure network interfaces and load balancers by default. 

## List of F5 ARM templates for Azure deployments

To see a list of all of supported Azure ARM templates, see the **[Azure Supported Template index](https://github.com/F5Networks/f5-azure-arm-templates/blob/master/template-index.md)**. See the **experimental** directory for experimental templates.
Note that many of the solutions now include the *provisionPublicIP* option.  This means that the templates deploy without creating or attaching any public IP addresses to the BIG-IP VEs, see the individual README files for more information.
Standalone and HA production stack templates have been deprecated.

### Known Issues
All known issues are on GitHub for better tracking and visibility. See issues with a label of **Known Issues** at https://github.com/Mikej81/f5-azure-mag-arm-templates/issues.

These templates are built specifically to work in MAG and Stack, so features will generally not be bleeding edge.

## Licensing Options
For each template, you have different options for licensing your BIG-IP VE(s).  Note that not all options are available for all templates.

  - **BYOL** <br>Bring your own license (BYOL) templates require you have a valid BIG-IP license token/key that you enter in the template.  Contact your F5 Sales representative to acquire BYOL licenses.

  - **PAYG** <br>Pay as you go (PAYG) templates allow you to use hourly licensing, so you do not need to have an existing F5 license.

  - **BIG-IQ** <br>[BIG-IQ](https://f5.com/products/big-iq-centralized-management) licensing templates use an existing BIG-IQ device with a License pool of BIG-IP VE BYOL licenses.  You must have a BIG-IQ and a pool of BIG-IP VE BYOL license to use these templates.


---

### License

#### Apache V2.0

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations
under the License.