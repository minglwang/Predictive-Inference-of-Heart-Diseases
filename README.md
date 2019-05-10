
      
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
Let $$\inline y$$ denote the blood pressure, $$\inline x_1, x_2$$ denote the *binary records* and *age*, respectively. There are 4 new patients with their age and blood pressure as follows:
| patient #        | Age           | medication  |
| ------------- |:-------------:| -----:|
| 1     | 38 | no |
| 2      | 61      |   no |
| 3 | 38     |    yes |
|4| 61|yes|

## Blood Pressure Prediction

We now consider a linear predictor with the form:

$$\hat{y} = \phi(x)^T \boldsymbol{\beta}$$

where $$\phi(x) = \begin{bmatrix}
1\\
x_1\\
x_2\\
x_{1} x_{2}\\
\end{bmatrix}$$ and $$\inline \boldsymbol{\beta} = \begin{bmatrix}\beta_{1}\\ \beta_{2}\\ \beta_{3}\\ \beta_{4}\\ \end{bmatrix}$$ .

The plug-in estimator for the prediction weight $$b$$ is the least-square estimate,

$$ \hat{\beta}=E_{n}[\phi(x)\phi^{T}(x)]^{-1}\E_n[\phi(x)y]\\
 =\left[\frac{1}{n}\sum_{i=1}^{n}\phi_i(x)\phi_i^{T}(x)\right]\left[\frac{1}{n}\sum_{i=1}^{n}\phi_i(x)y\right]\\
$$

The calculation is implemented using the codes [least square estimate.m](#).

The confidence region for predictive effect of $\beta_1$ and $\beta_2$ are given as 
	$$\bar{\mathcal{C}}_{\alpha}=\left\{|\hat{\beta}_i-\beta_i|\leq \sqrt{c_{\alpha C_{ii}/n}}, i=1,2\right\}$$

where $$ \inline C_{ii}=\left[\E_{n}[\phi\phi^{T}]^{-1}\text{Cov}[\phi\varepsilon]\E_{n}[\phi\phi^{T}]^{-1}\right]_{ii}$$, $$ \inline \varepsilon=y-\phi^{T}\beta $$.

Now we have
	
$$\text{Cov}[\phi\varepsilon]=\E_{n}[\phi\varepsilon\varepsilon^T\phi^T].$$

Given a confidence level $$ \inline \alpha=95\%$$, we can get a confidence region 
	$$\inline \beta_1=-10.1\pm 0.6$$, $$\inline \beta_2=2.0\pm 0.008.$$
The code for calculating the confidence interval is given in [confidence_interval.m](#).


Given the *age* and *medication* Use our method, we calculate the non-parametric prediction region. The prediction of new patient \# 1 is calculated using the learned predictor above,

$$\hat{y}_{#1}=\phi^{T}(x_{\#1})\hat{\beta}$$

Consider the point $$\inline (x_{\#1},y_{\#1})$$ and augment $$\inline \boldsymbol{z}^{n}$$ to a new data set $$\inline \tilde{\boldsymbol{z}}^{n+1}$$, we measure the inconsistency as 

$$s_{i}=\Vert y_{i}-y_{\#1}\Vert$$

The inconsistency rank of $$\inline y_{\# 1}$$ is  defined as
$$r(y_{\text{\#}1})=\frac{1}{n+1}\sum_{i=1}^{n+1}I\{s_i\leq s_{n+1}\}$$ and $$(n+1)*r(y_{\text{\#}1})$$ is uniformly distributed. Thus, we can constructed a non-parametric prediction region as
$$	\mathcal{Y}_{\alpha}=\left\{y_{\text{\#}1}\mid (n+1)(1-\alpha)\geq (n+1)r(y_{\text{\#}1})\right\}
$$

So, we can use the binary search method to find this region. Here, $$ \inline \hat{y}_{\text{\#}1}=E_{n}[y_{\text{\#} 1}]$$. The search can be conducted from $$\inline \hat{y}_{\text{\#}1}$$ toward the upper bound and lower bound. After that, we use the augmented set $$\inline \tilde{\boldsymbol{z}}^{n+1}$$ as our data to update the learned weights and predict the next patient. The predictions and the prediction regions of the four new patients are presented in Fig. 1. The detailed implementations are given in [predictive code.m](#).

<p align = "center">
<img width = "400" height = "300" src = "https://user-images.githubusercontent.com/45757826/57530651-fe65f100-7337-11e9-8322-bdecc5b9e636.jpg">
</p>
Figure 1. The predictions and the prediction regions of the four new patients. 

## Disease prognosis



# How To Use


