import numpy.random
import numpy.cov

x1 = np.random.normal(mu, sigma, 10000)
x2 = np.random.normal(mu, sigma, 10000)

def bi_gaussian_pdf(x1,x2,mu,E):

    data=np.random.multivariate_normal(mean,cov,size=n_samples)