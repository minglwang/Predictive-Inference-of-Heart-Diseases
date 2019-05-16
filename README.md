# Statistical-Inferences-of-Heart-Diseases

# Table of Content
- [Data Description](#data-description)
- [Predictive Inferences](#predictive-inferences)
  - [Blood Pressure Prediction](#blood-pressure-prediction)
  - [Disease Prognosis](#disease-prognosis)
- [Causal Inference of Medication](#causal-inference-of-medication)
- [How To Use](#how-to-use)


# Data Description

The heart diseases data contain the following variates:
1. *blood pressures* of patients
2. *medication records* {0,1} that indicating not receiving/receiving heart medication
3. *age* of a patient in years

The blood pressure data of the patients with/ without medications are presented in Fig. 1.

<p align = "center">
<img width = "300" height = "200" src="https://user-images.githubusercontent.com/45757826/57534050-6ec44080-733f-11e9-88bb-1c9a4ac9d323.png">
	
						Figure 1. medication vs.  blood presure
</p>
 

There are 4 new patients with their ages and blood pressures as follows:

| patient #        | Age           | medication  |
| ------------- |:-------------:| -----:|
| 1     | 38 | no |
| 2      | 61      |   no |
| 3 | 38     |    yes |
|4| 61|yes|


## Our objective 

When a new patient arrives at a hospital, we would like to

- predict the blood pressure of new patients with confidence intervals

- prognosis whether the patient has heart disease or not

- quatify the causal effect of the medication on blood pressure 



# Predictive Inferences
Let <img src="https://tex.s2cms.ru/svg/%5Cinline%20y" alt="\inline y" /> denote the blood pressure, <img src="https://tex.s2cms.ru/svg/%5Cinline%20x_1%2C%20x_2" alt="\inline x_1, x_2" /> denote the *binary records* and *age*, respectively. 

## Blood Pressure Prediction

We now consider a linear predictor with the form:

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%5Chat%7By%7D%20%3D%20%5Cphi(x)%5ET%20%5Cboldsymbol%7B%5Cbeta%7D" alt="\hat{y} = \phi(x)^T \boldsymbol{\beta}" />
</p>

where 
<p align = "center">
<img src="https://tex.s2cms.ru/svg/%5Cphi(x)%20%3D%20%5Cbegin%7Bbmatrix%7D%0A1%5C%5C%0Ax_1%5C%5C%0Ax_2%5C%5C%0Ax_%7B1%7D%20x_%7B2%7D%5C%5C%0A%5Cend%7Bbmatrix%7D" alt="\phi(x) = \begin{bmatrix}
1\\
x_1\\
x_2\\
x_{1} x_{2}\\
\end{bmatrix}" />,    
<img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Cboldsymbol%7B%5Cbeta%7D%20%3D%20%5Cbegin%7Bbmatrix%7D%5Cbeta_%7B1%7D%5C%5C%20%5Cbeta_%7B2%7D%5C%5C%20%5Cbeta_%7B3%7D%5C%5C%20%5Cbeta_%7B4%7D%5C%5C%20%5Cend%7Bbmatrix%7D" alt="\inline \boldsymbol{\beta} = \begin{bmatrix}\beta_{1}\\ \beta_{2}\\ \beta_{3}\\ \beta_{4}\\ \end{bmatrix}" /> .
</p>

The plug-in estimator for the prediction weight <img src="https://tex.s2cms.ru/svg/b" alt="b" /> is the least-square estimate,

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%20%5Chat%7B%5Cbeta%7D%3DE_%7Bn%7D%5B%5Cphi(x)%5Cphi%5E%7BT%7D(x)%5D%5E%7B-1%7D%5CE_n%5B%5Cphi(x)y%5D%5C%5C%0A%20%3D%5Cleft%5B%5Cfrac%7B1%7D%7Bn%7D%5Csum_%7Bi%3D1%7D%5E%7Bn%7D%5Cphi_i(x)%5Cphi_i%5E%7BT%7D(x)%5Cright%5D%5Cleft%5B%5Cfrac%7B1%7D%7Bn%7D%5Csum_%7Bi%3D1%7D%5E%7Bn%7D%5Cphi_i(x)y%5Cright%5D%5C%5C%0A" alt=" \hat{\beta}=E_{n}[\phi(x)\phi^{T}(x)]^{-1}\E_n[\phi(x)y]\\
 =\left[\frac{1}{n}\sum_{i=1}^{n}\phi_i(x)\phi_i^{T}(x)\right]\left[\frac{1}{n}\sum_{i=1}^{n}\phi_i(x)y\right]\\
" />
</p>

The calculation is implemented using the codes [LS_estimate.m](https://github.com/minglwang/Predictive-Inferences-of-Heart-Diseases/blob/master/predictive_inference/LS_estimate.m).

The confidence region for predictive effect of <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Cbeta_1" alt="\inline \beta_1" /> and <img src="https://tex.s2cms.ru/svg/%5Cinline%5Cbeta_2" alt="\inline\beta_2" />  are given as 

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%5Cbar%7B%5Cmathcal%7BC%7D%7D_%7B%5Calpha%7D%3D%5Cleft%5C%7B%7C%5Chat%7B%5Cbeta%7D_i-%5Cbeta_i%7C%5Cleq%20%5Csqrt%7Bc_%7B%5Calpha%20C_%7Bii%7D%2Fn%7D%7D%2C%20i%3D1%2C2%5Cright%5C%7D" alt="\bar{\mathcal{C}}_{\alpha}=\left\{|\hat{\beta}_i-\beta_i|\leq \sqrt{c_{\alpha C_{ii}/n}}, i=1,2\right\}" />
</p>

where <img src="https://tex.s2cms.ru/svg/%20%5Cinline%20C_%7Bii%7D%3D%5Cleft%5B%5CE_%7Bn%7D%5B%5Cphi%5Cphi%5E%7BT%7D%5D%5E%7B-1%7D%5Ctext%7BCov%7D%5B%5Cphi%5Cvarepsilon%5D%5CE_%7Bn%7D%5B%5Cphi%5Cphi%5E%7BT%7D%5D%5E%7B-1%7D%5Cright%5D_%7Bii%7D" alt=" \inline C_{ii}=\left[\E_{n}[\phi\phi^{T}]^{-1}\text{Cov}[\phi\varepsilon]\E_{n}[\phi\phi^{T}]^{-1}\right]_{ii}" />, <img src="https://tex.s2cms.ru/svg/%20%5Cinline%20%5Cvarepsilon%3Dy-%5Cphi%5E%7BT%7D%5Cbeta%20" alt=" \inline \varepsilon=y-\phi^{T}\beta " />.

Now we have

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%5Ctext%7BCov%7D%5B%5Cphi%5Cvarepsilon%5D%3DE_%7Bn%7D%5B%5Cphi%5Cvarepsilon%5Cvarepsilon%5ET%5Cphi%5ET%5D." alt="\text{Cov}[\phi\varepsilon]=E_{n}[\phi\varepsilon\varepsilon^T\phi^T]." />
</p>

Given a confidence level <img src="https://tex.s2cms.ru/svg/%20%5Cinline%20%5Calpha%3D95%5C%25" alt=" \inline \alpha=95\%" />, we can get a confidence region 
	<img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Cbeta_1%3D-10.1%5Cpm%200.6" alt="\inline \beta_1=-10.1\pm 0.6" />, <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Cbeta_2%3D2.0%5Cpm%200.008." alt="\inline \beta_2=2.0\pm 0.008." />

The code for calculating the confidence interval is given in [parameter_CI.m](https://github.com/minglwang/Predictive-Inferences-of-Heart-Diseases/blob/master/predictive_inference/parameter_CI.m).

#### Predictive Confidence interval

Given the *age* and *medication* of the new patients,  we calculate the non-parametric prediction region using the above method. The prediction of new patient # 1 is calculated using the learned predictor above,

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%5Chat%7By%7D_%7B%231%7D%3D%5Cphi%5E%7BT%7D(x_%7B%5C%231%7D)%5Chat%7B%5Cbeta%7D" alt="\hat{y}_{#1}=\phi^{T}(x_{\#1})\hat{\beta}" />
</p>

Consider the point <img src="https://tex.s2cms.ru/svg/%5Cinline%20(x_%7B%5C%231%7D%2Cy_%7B%5C%231%7D)" alt="\inline (x_{\#1},y_{\#1})" /> and augment <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Cboldsymbol%7Bz%7D%5E%7Bn%7D" alt="\inline \boldsymbol{z}^{n}" /> to a new data set <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Ctilde%7B%5Cboldsymbol%7Bz%7D%7D%5E%7Bn%2B1%7D" alt="\inline \tilde{\boldsymbol{z}}^{n+1}" />, we measure the inconsistency as 

<p align = "center">
<img src="https://tex.s2cms.ru/svg/s_%7Bi%7D%3D%5CVert%20y_%7Bi%7D-y_%7B%5C%231%7D%5CVert" alt="s_{i}=\Vert y_{i}-y_{\#1}\Vert" />
</p>

The inconsistency rank of <img src="https://tex.s2cms.ru/svg/%5Cinline%20y_%7B%5C%23%201%7D" alt="\inline y_{\# 1}" /> is  defined as
 
 <p align = "center">
 <img src="https://tex.s2cms.ru/svg/%20r(y_%7B%5Ctext%7B%5C%23%7D1%7D)%3D%5Cfrac%7B1%7D%7Bn%2B1%7D%5Csum_%7Bi%3D1%7D%5E%7Bn%2B1%7DI%5C%7Bs_i%5Cleq%20s_%7Bn%2B1%7D%5C%7D" alt=" r(y_{\text{\#}1})=\frac{1}{n+1}\sum_{i=1}^{n+1}I\{s_i\leq s_{n+1}\}" /> 
</p>

 and <img src="https://tex.s2cms.ru/svg/%20%5Cinline%20(n%2B1)*r(y_%7B%5Ctext%7B%5C%23%7D1%7D)" alt=" \inline (n+1)*r(y_{\text{\#}1})" /> is uniformly distributed. Thus, we can constructed a non-parametric prediction region as

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%09%5Cmathcal%7BY%7D_%7B%5Calpha%7D%3D%5Cleft%5C%7By_%7B%5Ctext%7B%5C%23%7D1%7D%5Cmid%20(n%2B1)(1-%5Calpha)%5Cgeq%20(n%2B1)r(y_%7B%5Ctext%7B%5C%23%7D1%7D)%5Cright%5C%7D%0A" alt="	\mathcal{Y}_{\alpha}=\left\{y_{\text{\#}1}\mid (n+1)(1-\alpha)\geq (n+1)r(y_{\text{\#}1})\right\}
" />
</p>

So, we can use the [binary search method](https://github.com/minglwang/Statistical-Inferences-of-Heart-Diseases/blob/master/predictive_inference/bi_search_lb.m) to find this region. Here,  <img src="https://tex.s2cms.ru/svg/%20%5Cinline%20%5Chat%7By%7D_%7B%5Ctext%7B%5C%23%7D1%7D%3DE_%7Bn%7D%5By_%7B%5Ctext%7B%5C%23%7D%201%7D%5D" alt=" \inline \hat{y}_{\text{\#}1}=E_{n}[y_{\text{\#} 1}]" />. The search can be conducted from <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Chat%7By%7D_%7B%5Ctext%7B%5C%23%7D1%7D" alt="\inline \hat{y}_{\text{\#}1}" /> toward the upper bound and lower bound. After that, we use the augmented set <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Ctilde%7B%5Cboldsymbol%7Bz%7D%7D%5E%7Bn%2B1%7D" alt="\inline \tilde{\boldsymbol{z}}^{n+1}" /> as our data to update the learned weights and predict the next patient. The predictions and the prediction regions of the four new patients are presented in Fig. 2. The detailed implementations are given in [predictive CI.m](https://github.com/minglwang/Predictive-Inferences-of-Heart-Diseases/blob/master/predictive_inference/predictive_CI.m).

<p align = "center">
<img width = "400" height = "300" src = "https://user-images.githubusercontent.com/45757826/57531896-d88e1b80-733a-11e9-94ac-738bfc38755c.png">
	
			Figure 2. The predictions and the prediction regions (blue lines) of the four new patients. 
</p>



We can see from Fig. 2 that
- patients with medication will have a lower blood pressure,  (patient #1 > patient #3, patient #2 > patient #4)  
- aged patients are more likely to have higher blood pressure.

[Back To The Top](#statistical-inferences-of-heart-diseases)

## Disease Prognosis

In this section, we will use the *age* and *blood pressure* as our input feature to prognosis whether a patient has heart disease or not ({1,0}). We propose two approaches:
- a generative method: Gaussian covariate model
- a discriminative method: Bernoulli approach  

## Gaussian covariate model

The Gaussian covariate models are used for the data,

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%20p(%5Cboldsymbol%7Bx%7D%5Cmid%20y%3Dk)-%3D%5Cmathcal%7BN%7D(%5Cboldsymbol%7Bx%7D%5Cmid%20%5Cboldsymbol%7B%5Cmu%7D_k%2C%5Cboldsymbol%7B%5CSigma%7D_%7Bk%7D)%0A" alt=" p(\boldsymbol{x}\mid y=k)-=\mathcal{N}(\boldsymbol{x}\mid \boldsymbol{\mu}_k,\boldsymbol{\Sigma}_{k})
" />
</p>

where <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Cboldsymbol%7Bx%7D%20%3D%5C%7Bx_1%2C%20x_2%5C%7D%20" alt="\inline \boldsymbol{x} =\{x_1, x_2\} " />.

In the training phase, we have the label of each patient, e.g. we know the patient has heart disease or not. Then, we can use the data to estimate the model parameters, 

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%20%5Cboldsymbol%7B%5Cmu%7D_k%3DE_%7Bn%7D%20%5B%5Cboldsymbol%7Bx%7D_%7Bi%7D%7Cy%3Dk%5D%2C%5Cquad%09%5Cboldsymbol%7B%5CSigma%7D_%7Bk%7D%3D%5Ctext%7BCov%7D_%7Bn%7D%20%5B%5Cboldsymbol%7Bx%7D_%7Bi%7D%7Cy%3Dk%5D." alt=" \boldsymbol{\mu}_k=E_{n} [\boldsymbol{x}_{i}|y=k],\quad	\boldsymbol{\Sigma}_{k}=\text{Cov}_{n} [\boldsymbol{x}_{i}|y=k]." />
</p>

Then the categorical distribution or prior distribution of each category can be obtained as  

<p align = "center">
<img src="https://tex.s2cms.ru/svg/p_%7Bn%7D(y%3Dk)%3D%5Cfrac%7Bn_%7Bk%7D%7D%7Bn%7D." alt="p_{n}(y=k)=\frac{n_{k}}{n}." />
</p>

The generative model is can be calculated using the Bayes theorem,

<p align = "center">
<img src="https://tex.s2cms.ru/svg/p_(y%3Dk%7C%5Cboldsymbol%7Bx%7D)%3D%5Cfrac%7Bp_%7B%5Chat%7B%5Ctheta%7D%7D(%5Cboldsymbol%7Bx%7D%5Cmid%20y%3Dk)p_%7Bn%7D(y%3Dk)%7D%7Bp_%7B%5Chat%7B%5Ctheta%7D%7D(x)%7D" alt="p_(y=k|\boldsymbol{x})=\frac{p_{\hat{\theta}}(\boldsymbol{x}\mid y=k)p_{n}(y=k)}{p_{\hat{\theta}}(x)}" />
</p>

where <img src="https://tex.s2cms.ru/svg/%5Cinline%20p_%7B%5Chat%7B%5Ctheta%7D%7D(x)%3D%5Csum_%7By%7Dp_%7B%5Chat%7B%5Ctheta%7D%5Cmid%20y%3Dk%7Dp_%7B%5Chat%7B%5Ctheta%7D%7D(y)" alt="\inline p_{\hat{\theta}}(x)=\sum_{y}p_{\hat{\theta}\mid y=k}p_{\hat{\theta}}(y)" />. The Gaussian co-variate models are presented in Fig. 3. 

<p align = "center">
<img width = "400" height ="300" src = "https://user-images.githubusercontent.com/45757826/57548665-d4292900-7361-11e9-9037-6f30e4e2fa3f.png">

						Figure 3. Gaussian covariate model
</p>


## Bernoulli approach  
An alternative approach is to learn <img src="https://tex.s2cms.ru/svg/%5Cinline%20p_%7B%5Ctheta%7D(y%20%5Cmid%20x)" alt="\inline p_{\theta}(y \mid x)" /> directly. Specifically, we consider a parameteric model class <img src="https://tex.s2cms.ru/svg/%5Cinline%20p_%7B%5Ctheta%7D(y%20%5Cmid%20x)%20%3D%20" alt="\inline p_{\theta}(y \mid x) = " /> Bernoulli(<img src="https://tex.s2cms.ru/svg/%20%5Cinline%20%5Cphi%5E%7BT%7D(x)%5Ctheta" alt=" \inline \phi^{T}(x)\theta" />). The resulting loss function is 

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%20%5Cell(%5Cboldsymbol%7Bz%7D%5E%7Bn%7D)%20%3D%20-%5Csum_%7Bi%3D1%7D%5E%7Bn%7D%20y_%7Bi%7D%20%5Cln%20%5Cpi_i(%5Ctheta)%20%2B%20(1-y_%7Bi%7D)(1-%5Cpi_%7Bi%7D(%5Ctheta))" alt=" \ell(\boldsymbol{z}^{n}) = -\sum_{i=1}^{n} y_{i} \ln \pi_i(\theta) + (1-y_{i})(1-\pi_{i}(\theta))" />
</p>

where 

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%5Cpi_%7Bi%7D(%5Ctheta)%20%3Dp_%7B%5Ctheta%7D(y%3D1%20%5Cmid%20x)%20%3D%5Cfrac%7Bexp(%5Cphi%5E%7BT%7D(x_i)%5Ctheta)%7D%7B1%2B%20exp(%5Cphi%5E%7BT%7D(x_i)%5Ctheta)%7D%20" alt="\pi_{i}(\theta) =p_{\theta}(y=1 \mid x) =\frac{exp(\phi^{T}(x_i)\theta)}{1+ exp(\phi^{T}(x_i)\theta)} " /> 
</p>

is a parametric model. Then we use a [majorization minimization search](https://github.com/minglwang/Statistical-Inferences-of-Heart-Diseases/blob/master/predictive_inference/major_min.m)  method to compute


<p align = "center">
<img src="https://tex.s2cms.ru/svg/%20%5Chat%7B%5Ctheta%7D%20%5Cin%20%5Carg%20%5Cmin%20%5C%3A%20%5Cell_%7B%5Ctheta%7D(%5Cboldsymbol%7Bz%7D%5En)" alt=" \hat{\theta} \in \arg \min \: \ell_{\theta}(\boldsymbol{z}^n)" />
</p>

- To set up the method, we start with

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%20%5Cpartial%5E2%20%5Cell_%7B%5Ctheta%7D(%5Cboldsymbol%7Bz%7D%5E%7Bn%7D)%20%3D%20%5Csum_%7Bi%3D1%7D%5E%7Bn%7D%20%5Cpi_%7Bi%7D(%5Ctheta)(1%20-%20%5Cpi_%7Bi%7D(%5Ctheta)%5Cphi_%7Bi%7D%20%5Cphi_i%5E%7BT%7D)%20%5Cgeq%20%5Cboldsymbol%7B0%7D%2C%20%5Cforall%20%5Ctheta%0A" alt=" \partial^2 \ell_{\theta}(\boldsymbol{z}^{n}) = \sum_{i=1}^{n} \pi_{i}(\theta)(1 - \pi_{i}(\theta)\phi_{i} \phi_i^{T}) \geq \boldsymbol{0}, \forall \theta
" />
</p>
 
and therefore <img src="https://tex.s2cms.ru/svg/%20%5Cinline%20%5Cell_%5Ctheta%20" alt=" \inline \ell_\theta " /> is convex in <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Ctheta" alt="\inline \theta" />. 

- In addition, since <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Cpi_%7Bi%7D%20%5Cin%20%5B0%2C1%5D" alt="\inline \pi_{i} \in [0,1]" />, it follows that

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%20%5Cpi_%7Bi%7D(1-%5Cpi)%20%5Cleq%20%5Cfrac%7B1%7D%7B4%7D" alt=" \pi_{i}(1-\pi) \leq \frac{1}{4}" />
</p>

Then we combine the above facts, we see that one possible majorizing function is

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%20%5Cell_%7B%5Ctheta%20%5Cmid%20%5Ctilde%7B%5Ctheta%7D%7D%20%3D%20%5Cell_%7B%5Ctilde%7B%5Ctheta%7D%7D%2B%20v%5ET%20(%5Ctheta%20-%20%5Ctilde%7B%5Ctheta%7D)%0A%2B%5Cfrac%7B1%7D%7B2%7D%20(%5Ctheta%20-%20%5Ctilde%7B%5Ctheta%7D)%5E%7BT%7D%20%5Cboldsymbol%7BQ%7D%20(%5Ctheta%20-%20%5Ctilde%7B%5Ctheta%7D)" alt=" \ell_{\theta \mid \tilde{\theta}} = \ell_{\tilde{\theta}}+ v^T (\theta - \tilde{\theta})
+\frac{1}{2} (\theta - \tilde{\theta})^{T} \boldsymbol{Q} (\theta - \tilde{\theta})" />
</p>

where <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Cboldsymbol%7BQ%7D%20%3D%5Cfrac%7B1%7D%7B4%7D%20%5Csum_%7B1%7D%5E%7B4%7D%5Cphi_%7Bi%7D%5Cphi_%7Bi%7D%5ET%20" alt="\inline \boldsymbol{Q} =\frac{1}{4} \sum_{1}^{4}\phi_{i}\phi_{i}^T " /> and <img src="https://tex.s2cms.ru/svg/%20%5Cinline%20v%20%3D%20%5Cpartial%20%5Cell_%7B%5Ctheta%7D%5Cmid_%7B%5Ctheta%3D%5Ctilde%7B%5Ctheta%7D%7D%20%3D%20-%5Csum_%7Bi%3D1%7D%5E%7Bn%7D(y_i-%5Cpi_%7Bi%7D(%5Ctheta))%5Cphi_%7Bi%7D" alt=" \inline v = \partial \ell_{\theta}\mid_{\theta=\tilde{\theta}} = -\sum_{i=1}^{n}(y_i-\pi_{i}(\theta))\phi_{i}" />.

According to the majorization-minimization (MM) search, we can update <img src="https://tex.s2cms.ru/svg/%20%5Cinline%20%5Ctilde%7B%5Ctheta%7D" alt=" \inline \tilde{\theta}" /> as

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%5Ctilde%7B%5Ctheta%7D_%7Bm%2B1%7D%26%3D%5Ctilde%7B%5Ctheta%7D_%7Bm%7D-Q%5E%7B-1%7Dv%5E%7BT%7D%3D%5Ctilde%7B%5Ctheta%7D_%7Bm%7D%2B4%5Cleft(%5Csum_%7Bi%3D1%7D%5E%7Bn%7D%5Cphi_i%5Cphi_i%5E%7BT%7D%5Cright)%5E%7B-1%7D%5Cleft(%5Csum_%7Bi%3D1%7D%5E%7Bn%7D%20%5Cphi_i%5ET(y_i-%5Cpi(%5Ctilde%7B%5Ctheta%7D_m))%5Cright)." alt="\tilde{\theta}_{m+1}&amp;=\tilde{\theta}_{m}-Q^{-1}v^{T}=\tilde{\theta}_{m}+4\left(\sum_{i=1}^{n}\phi_i\phi_i^{T}\right)^{-1}\left(\sum_{i=1}^{n} \phi_i^T(y_i-\pi(\tilde{\theta}_m))\right)." />
</p>

After MM has converged, we obtain

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%5Chat%7B%5Ctheta%7D%3D%20%20%5Cbegin%7Bbmatrix%7D%0A%09-41.25%5C%5C%0A%09-0.18%5C%5C%0A%090.42%5C%5C%0A%09%5Cend%7Bbmatrix%7D" alt="\hat{\theta}=  \begin{bmatrix}
	-41.25\\
	-0.18\\
	0.42\\
	\end{bmatrix}" />
</p>

We compare the decision boundaries of the generative model and discriminative model in
Fig. 4 and Fig. 5, respectively. 

<p align = "center">
<img width = "400" height ="300" src = "https://user-images.githubusercontent.com/45757826/57550495-df328800-7366-11e9-9eb9-b94f181338c7.png">

					Figure 4. The generative model and its decision boundary
</p>

<p align = "center">
<img width = "400" height ="300" src = "https://user-images.githubusercontent.com/45757826/57550451-b611f780-7366-11e9-925d-3bc0aca8b330.png">

					Figure 5. The generative model and its decision boundary
</p>

By comparing Fig. 4 and Fig. 5, it is evident that the generative model gives a smoother nonlinear boundary which better separates the two classes of data.

[Back To The Top](#statistical-inferences-of-heart-diseases)



# Causal Inference of Medication

<p align = "center">
<img width = "500" height ="300" src = "https://user-images.githubusercontent.com/45757826/57566604-edb48a00-73ce-11e9-8575-90e518fcace9.png">

						Figure 6. causal structure S
</p>


We consider *age* (<img src="https://tex.s2cms.ru/svg/%5Cinline%20x_2" alt="\inline x_2" />) to be a confounding variable that affects both the probability of taking the medication (<img src="https://tex.s2cms.ru/svg/%20%5Cinline%20x_1" alt=" \inline x_1" />) as well as the *blood pressure* <img src="https://tex.s2cms.ru/svg/%5Cinline%20y" alt="\inline y" />. We set up the causal structure <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Cmathcal%7BS%7D" alt="\inline \mathcal{S}" /> as a graph in Fig. 6 

The counterfactual graph is set up in Fig. 7, where <img src="https://tex.s2cms.ru/svg/%5Cinline%20x_2" alt="\inline x_2" /> is a valid control variable.

<p align = "center">
<img width = "300" height ="200" src = "https://user-images.githubusercontent.com/45757826/57571814-f62eb400-7412-11e9-8cd0-f67652ba20d6.png">

						Figure 7. counterfact graph S'
</p>

The causal effect of medication, denoted as <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Ctau%20" alt="\inline \tau " /> can be calculated by two approaches

- linear predictor
- weighted average form

In the linear predictor form, we use a linear predictor to approximate <img src="https://tex.s2cms.ru/svg/%5Cinline%20E%5By%5Cmid%20x_1%20%3D%20x_1'%2C%20x_2%5D" alt="\inline E[y\mid x_1 = x_1', x_2]" />,

<p align = "center">
<img src="https://tex.s2cms.ru/svg/y%20%3D%20%5Cbeta_%7B0%7D%2B%5Cbeta_%7B1%7Dx_1%2B%20%5Cbeta_%7B2%7Dx_2%2B%20%5Cbeta_3%20x_1%20x_2%20" alt="y = \beta_{0}+\beta_{1}x_1+ \beta_{2}x_2+ \beta_3 x_1 x_2 " />
</p>
Then the causal effect of medication can be calculated as
<p align = "center">
<img src="https://tex.s2cms.ru/svg/%20%5Ctau%20%3D%20E_%7Bx_%7B2%7D%7D%5Cleft%5B%20E%5By%5Cmid%20x_1'%3D1%2C%20x_2%5D%20-%20E%5By%5Cmid%20x_1'%3D0%2C%20x_2%5D%20%5Cright%5D%20%3D%20%20E_%7Bx_%7B2%7D%7D%5Cleft%5B%20%5Cbeta_1%20%2B%20%5Cbeta_3%20x_2%5Cright%5D%20%3D%20-9.99" alt=" \tau = E_{x_{2}}\left[ E[y\mid x_1'=1, x_2] - E[y\mid x_1'=0, x_2] \right] =  E_{x_{2}}\left[ \beta_1 + \beta_3 x_2\right] = -9.99" />
</p>

Alternatively, the weighted average form can be expressed as

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%0A%09E%5By_%7Bx_%7B1%7D'%7D%5D%3DE%5Cleft%5B%5Cfrac%7BI(x_1%3Dx_%7B1%7D')%7D%7Bp(x_1%5Cmid%20x_2)%7Dy%5Cright%5D." alt="
	E[y_{x_{1}'}]=E\left[\frac{I(x_1=x_{1}')}{p(x_1\mid x_2)}y\right]." />
</p>

Since the exposure <img src="https://tex.s2cms.ru/svg/%5Cinline%20x_1" alt="\inline x_1" /> is binary data, we use the logistic model for the conditional probability <img src="https://tex.s2cms.ru/svg/%20%5Cinline%20p(x_1%5Cmid%20x_2)" alt=" \inline p(x_1\mid x_2)" />,

<p align = "center">
<img src="https://tex.s2cms.ru/svg/p(x_1%3D1%5Cmid%20x_2)%3D(1%2B%5Cexp(%5Cbeta_0%2B%5Cbeta_1x_1))%5E%7B-1%7D." alt="p(x_1=1\mid x_2)=(1+\exp(\beta_0+\beta_1x_1))^{-1}." />
</p>

The identified parameter <img src="https://tex.s2cms.ru/svg/%5Cinline%20%5Chat%7B%5Cbeta%7D%3D%5B-19.5756%2C0.3901%5D." alt="\inline \hat{\beta}=[-19.5756,0.3901]." />  Substituting <img src="https://tex.s2cms.ru/svg/%5Chat%7B%5Cbeta%7D" alt="\hat{\beta}" /> back to the logistic regression model we can get the probabilities <img src="https://tex.s2cms.ru/svg/%20%5Cinline%20%5Chat%7Bp%7D(x_1%3D1%7Cx_2)" alt=" \inline \hat{p}(x_1=1|x_2)" /> and <img src="https://tex.s2cms.ru/svg/%5Chat%7Bp%7D(x_1%3D0%7Cx_2)%3D1-%5Chat%7Bp%7D(x_1%3D1%7Cx_2)" alt="\hat{p}(x_1=0|x_2)=1-\hat{p}(x_1=1|x_2)" />. 

<p align = "center">
<img src="https://tex.s2cms.ru/svg/%09%5Chat%7B%5Ctau%7D%3DE%5By_%7Bx_1'%3D1%7D%5D-E%5By_%7Bx_1'%3D0%7D%5D%3DE_%7Bn'%7D%5Cleft%5B%5Cfrac%7B1%7D%7B%5Chat%7Bp%7D(x_1%3D1%7Cx_2)%7Dy%5Cright%5D-E_%7Bn'%7D%5Cleft%5B%5Cfrac%7B1%7D%7B%5Chat%7Bp%7D(x_1%3D0%7Cx_%7B2%7D)%7Dy%5Cright%5D%3D-5.3405." alt="	\hat{\tau}=E[y_{x_1'=1}]-E[y_{x_1'=0}]=E_{n'}\left[\frac{1}{\hat{p}(x_1=1|x_2)}y\right]-E_{n'}\left[\frac{1}{\hat{p}(x_1=0|x_{2})}y\right]=-5.3405." />
</p>

# How To Use

To run the code, one should add folder "heart_disease_data" and "predictive_inference"to path using the code

```Matlab
addpath('your directories/Predictive-Inferences-of-Heart-Diseases/heart_disease_data')
```
- run [blood_pressure_prediction.m](https://github.com/minglwang/Predictive-Inferences-of-Heart-Diseases/blob/master/blood_pressure_prediction.m) to get the results in Fig. 2
- run [disease_prognosis.m](https://github.com/minglwang/Predictive-Inferences-of-Heart-Diseases/blob/master/disease_prognosis.m) to get the results in Fig. 3 to Fig. 5 
- run [causal_inferences.m](https://github.com/minglwang/Statistical-Inferences-of-Heart-Diseases/blob/master/causal_inference.m) to quantify the causal effect of medication on the blood pressure.

[Back To The Top](#statistical-inferences-of-heart-diseases)

