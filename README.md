
      
# Predictive-Inference-of-Heart_Diseases

# Table of Content
- [Data Decription](#description)
- [Predictive Inferences](#predictive)
  - [Blood Pressure Prediction](#prediction)
  - [disease prognosis](#prognosis)
- [How To Use](#how_to_use)


# Data Decription

The heart diseases data contains the following variates:
1. *blood pressures* of patients
2. *medication records* {0,1} that indicating not receiving/receiving heart medication
3. *age* of a patient in years

**Our objective** is to 

- predict his/her blood pressure with confidence intervals

- prognosis whether the patient has heart disease or not

where a new patient arrives at a hospital. 

# Predictive Inferences
Let <img src="https://tex.s2cms.ru/svg/%5Cinline%20y" alt="\inline y" /> denote the blood pressure, <img src="https://tex.s2cms.ru/svg/%5Cinline%20x_1%2C%20x_2" alt="\inline x_1, x_2" /> denote the *binary records* and *age*, respectively. There are 4 new patients with their age and blood pressure as follows:

| patient #        | Age           | medication  |
| ------------- |:-------------:| -----:|
| 1     | 38 | no |
| 2      | 61      |   no |
| 3 | 38     |    yes |
|4| 61|yes|

## Blood Pressure Prediction

We now consider a linear predictor with the form:

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%5Chat%7By%7D%20%3D%20%5Cphi(x)%5ET%20%5Cboldsymbol%7B%5Cbeta%7D" alt="\hat{y} = \phi(x)^T \boldsymbol{\beta}" />
</p>

where <img src="https://tex.s2cms.ru/svg/%5Cphi(x)%20%3D%20%5Cbegin%7Bbmatrix%7D%0A1%5C%5C%0Ax_1%5C%5C%0Ax_2%5C%5C%0Ax_%7B1%7D%20x_%7B2%7D%5C%5C%0A%5Cend%7Bbmatrix%7D" alt="\phi(x) = \begin{bmatrix}
1\\
x_1\\
x_2\\
x_{1} x_{2}\\
\end{bmatrix}" /> and <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Cboldsymbol%7B%5Cbeta%7D%20%3D%20%5Cbegin%7Bbmatrix%7D%5Cbeta_%7B1%7D%5C%5C%20%5Cbeta_%7B2%7D%5C%5C%20%5Cbeta_%7B3%7D%5C%5C%20%5Cbeta_%7B4%7D%5C%5C%20%5Cend%7Bbmatrix%7D" alt="\inline \boldsymbol{\beta} = \begin{bmatrix}\beta_{1}\\ \beta_{2}\\ \beta_{3}\\ \beta_{4}\\ \end{bmatrix}" /> .

The plug-in estimator for the prediction weight <img src="https://tex.s2cms.ru/svg/b" alt="b" /> is the least-square estimate,

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%20%5Chat%7B%5Cbeta%7D%3DE_%7Bn%7D%5B%5Cphi(x)%5Cphi%5E%7BT%7D(x)%5D%5E%7B-1%7D%5CE_n%5B%5Cphi(x)y%5D%5C%5C%0A%20%3D%5Cleft%5B%5Cfrac%7B1%7D%7Bn%7D%5Csum_%7Bi%3D1%7D%5E%7Bn%7D%5Cphi_i(x)%5Cphi_i%5E%7BT%7D(x)%5Cright%5D%5Cleft%5B%5Cfrac%7B1%7D%7Bn%7D%5Csum_%7Bi%3D1%7D%5E%7Bn%7D%5Cphi_i(x)y%5Cright%5D%5C%5C%0A" alt=" \hat{\beta}=E_{n}[\phi(x)\phi^{T}(x)]^{-1}\E_n[\phi(x)y]\\
 =\left[\frac{1}{n}\sum_{i=1}^{n}\phi_i(x)\phi_i^{T}(x)\right]\left[\frac{1}{n}\sum_{i=1}^{n}\phi_i(x)y\right]\\
" />
</p>

The calculation is implemented using the codes [least square estimate.m](#).

The confidence region for predictive effect of <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Cbeta_1" alt="\inline \beta_1" /> and <img src="https://tex.s2cms.ru/svg/%5Cinline%5Cbeta_2" alt="\inline\beta_2" />  are given as 

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%5Cbar%7B%5Cmathcal%7BC%7D%7D_%7B%5Calpha%7D%3D%5Cleft%5C%7B%7C%5Chat%7B%5Cbeta%7D_i-%5Cbeta_i%7C%5Cleq%20%5Csqrt%7Bc_%7B%5Calpha%20C_%7Bii%7D%2Fn%7D%7D%2C%20i%3D1%2C2%5Cright%5C%7D" alt="\bar{\mathcal{C}}_{\alpha}=\left\{|\hat{\beta}_i-\beta_i|\leq \sqrt{c_{\alpha C_{ii}/n}}, i=1,2\right\}" />
</p>

where <img src="https://tex.s2cms.ru/svg/%20%5Cinline%20C_%7Bii%7D%3D%5Cleft%5B%5CE_%7Bn%7D%5B%5Cphi%5Cphi%5E%7BT%7D%5D%5E%7B-1%7D%5Ctext%7BCov%7D%5B%5Cphi%5Cvarepsilon%5D%5CE_%7Bn%7D%5B%5Cphi%5Cphi%5E%7BT%7D%5D%5E%7B-1%7D%5Cright%5D_%7Bii%7D" alt=" \inline C_{ii}=\left[\E_{n}[\phi\phi^{T}]^{-1}\text{Cov}[\phi\varepsilon]\E_{n}[\phi\phi^{T}]^{-1}\right]_{ii}" />, <img src="https://tex.s2cms.ru/svg/%20%5Cinline%20%5Cvarepsilon%3Dy-%5Cphi%5E%7BT%7D%5Cbeta%20" alt=" \inline \varepsilon=y-\phi^{T}\beta " />.

Now we have

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%5Ctext%7BCov%7D%5B%5Cphi%5Cvarepsilon%5D%3D%5CE_%7Bn%7D%5B%5Cphi%5Cvarepsilon%5Cvarepsilon%5ET%5Cphi%5ET%5D." alt="\text{Cov}[\phi\varepsilon]=\E_{n}[\phi\varepsilon\varepsilon^T\phi^T]." />
</p>

Given a confidence level <img src="https://tex.s2cms.ru/svg/%20%5Cinline%20%5Calpha%3D95%5C%25" alt=" \inline \alpha=95\%" />, we can get a confidence region 
	<img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Cbeta_1%3D-10.1%5Cpm%200.6" alt="\inline \beta_1=-10.1\pm 0.6" />, <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Cbeta_2%3D2.0%5Cpm%200.008." alt="\inline \beta_2=2.0\pm 0.008." />
The code for calculating the confidence interval is given in [confidence_interval.m](#).


Given the *age* and *medication* Use our method, we calculate the non-parametric prediction region. The prediction of new patient \# 1 is calculated using the learned predictor above,

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%5Chat%7By%7D_%7B%231%7D%3D%5Cphi%5E%7BT%7D(x_%7B%5C%231%7D)%5Chat%7B%5Cbeta%7D" alt="\hat{y}_{#1}=\phi^{T}(x_{\#1})\hat{\beta}" />
</p>

Consider the point <img src="https://tex.s2cms.ru/svg/%5Cinline%20(x_%7B%5C%231%7D%2Cy_%7B%5C%231%7D)" alt="\inline (x_{\#1},y_{\#1})" /> and augment <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Cboldsymbol%7Bz%7D%5E%7Bn%7D" alt="\inline \boldsymbol{z}^{n}" /> to a new data set <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Ctilde%7B%5Cboldsymbol%7Bz%7D%7D%5E%7Bn%2B1%7D" alt="\inline \tilde{\boldsymbol{z}}^{n+1}" />, we measure the inconsistency as 

<p align = "center">
<img src="https://tex.s2cms.ru/svg/s_%7Bi%7D%3D%5CVert%20y_%7Bi%7D-y_%7B%5C%231%7D%5CVert" alt="s_{i}=\Vert y_{i}-y_{\#1}\Vert" />
</p>

The inconsistency rank of <img src="https://tex.s2cms.ru/svg/%5Cinline%20y_%7B%5C%23%201%7D" alt="\inline y_{\# 1}" /> is  defined as
<img src="https://tex.s2cms.ru/svg/r(y_%7B%5Ctext%7B%5C%23%7D1%7D)%3D%5Cfrac%7B1%7D%7Bn%2B1%7D%5Csum_%7Bi%3D1%7D%5E%7Bn%2B1%7DI%5C%7Bs_i%5Cleq%20s_%7Bn%2B1%7D%5C%7D" alt="r(y_{\text{\#}1})=\frac{1}{n+1}\sum_{i=1}^{n+1}I\{s_i\leq s_{n+1}\}" /> and <img src="https://tex.s2cms.ru/svg/(n%2B1)*r(y_%7B%5Ctext%7B%5C%23%7D1%7D)" alt="(n+1)*r(y_{\text{\#}1})" /> is uniformly distributed. Thus, we can constructed a non-parametric prediction region as

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%09%5Cmathcal%7BY%7D_%7B%5Calpha%7D%3D%5Cleft%5C%7By_%7B%5Ctext%7B%5C%23%7D1%7D%5Cmid%20(n%2B1)(1-%5Calpha)%5Cgeq%20(n%2B1)r(y_%7B%5Ctext%7B%5C%23%7D1%7D)%5Cright%5C%7D%0A" alt="	\mathcal{Y}_{\alpha}=\left\{y_{\text{\#}1}\mid (n+1)(1-\alpha)\geq (n+1)r(y_{\text{\#}1})\right\}
" />
</p>

So, we can use the binary search method to find this region. Here, <img src="https://tex.s2cms.ru/svg/%20%5Cinline%20%5Chat%7By%7D_%7B%5Ctext%7B%5C%23%7D1%7D%3DE_%7Bn%7D%5By_%7B%5Ctext%7B%5C%23%7D%201%7D%5D" alt=" \inline \hat{y}_{\text{\#}1}=E_{n}[y_{\text{\#} 1}]" />. The search can be conducted from <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Chat%7By%7D_%7B%5Ctext%7B%5C%23%7D1%7D" alt="\inline \hat{y}_{\text{\#}1}" /> toward the upper bound and lower bound. After that, we use the augmented set <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Ctilde%7B%5Cboldsymbol%7Bz%7D%7D%5E%7Bn%2B1%7D" alt="\inline \tilde{\boldsymbol{z}}^{n+1}" /> as our data to update the learned weights and predict the next patient. The predictions and the prediction regions of the four new patients are presented in Fig. 1. The detailed implementations are given in [predictive code.m](#).

<p align = "center">
<img width = "400" height = "300" src = "https://user-images.githubusercontent.com/45757826/57531896-d88e1b80-733a-11e9-94ac-738bfc38755c.png">
</p>

Figure 1. The predictions and the prediction regions of the four new patients. 

## Disease prognosis



# How To Use

