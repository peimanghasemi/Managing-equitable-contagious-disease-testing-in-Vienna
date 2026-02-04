# Managing-equitable-contagious-disease-testing-in-Vienna by MATLAB
Ghasemi, P., Ehmke, J. F., &amp; Bicher, M. (2025). Managing equitable contagious disease testing: A mathematical model for resource optimization. OMEGA-INTERNATIONAL JOURNAL OF MANAGEMENT SCIENCE, 135. https://doi.org/10.1016/j.omega.2025.103305

**Overview**
This repository provides a small-scale validation implementation of the Multi-Objective Variable Neighborhood Search (MOVNS) algorithm

**Data Privacy and Confidentiality**
The Vienna case study used confidential operational, spatial, and epidemiological data obtained from external stakeholders and public health authorities.
These data are protected by privacy, ethical, and contractual restrictions, and therefore cannot be shared publicly.

**Purpose of This Repository**
•	Validate and demonstrate the structure of the MOVNS algorithm
•	Reproduce the methodology described in the published article
•	Enable researchers to adapt the model to their own data and case studies
•	Promote transparent optimization research in healthcare and logistics

⚙️ **Model Characteristics**
•	 Multi-period Team Orienteering Problem (TOP) formulation

🎯 **Objectives**
•	 Maximize collected priority-weighted patient scores
•	 Minimize the number of unserved patients
	 **Features**:
	 
•	Risk-based prioritization using disease and contact data
•	Resource and working time limits for mobile testers
•	Laboratory capacity constraints
•	Period-wise demand rollover and reprioritization

	**Solution Method**
•	Multi-Objective Variable Neighborhood Search (MOVNS)
•	Includes VND, 2-Opt, 3-Opt, cross-exchange, and Pareto archive
	🛠️ **Environment**:
•	MATLAB-based implementation (easily portable to Python)
•	Compatible with small-to-large synthetic instances
