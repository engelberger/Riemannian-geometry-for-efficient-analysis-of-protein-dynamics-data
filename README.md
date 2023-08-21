# Riemannian geometry for efficient analysis of protein dynamics data

    [1] W. Diepeveen, C. Esteve-Yagüe, J. Lellmann, O. Öktem, C-B. Schönlieb.  
    Riemannian geometry for efficient analysis of protein dynamics data
    arXiv preprint arXiv:2308.07818. 2023 Aug 15.

Setup
-----

The recommended (and tested) setup is based on MacOS 13.4.1 running Python 3.8. Install the following dependencies with anaconda:

    # Create conda environment
    conda create --name rieprogeo1 python=3.8
    conda activate rieprogeo1

    # Clone source code and install
    git clone https://github.com/wdiepeveen/Riemannian-geometry-for-efficient-analysis-of-protein-dynamics-data.git
    cd "Riemannian-geometry-for-efficient-analysis-of-protein-dynamics-data"
    pip install -r requirements.txt


Reproducing the experiments in [1]
----------------------------------

The jupyter notebook `experiment/protein_conformation_processing.ipynb` has been used to produce the results in [1]. 
* For the adenylate kinase results use `struct = 1`.
* For the SARS-CoV-2 helicase nsp 13 use `struct = 2`.



## PointCloud

This code provides a class for operations related to point clouds in a manifold space. Instances of the class are initialized with the dimensions of the manifold and the number of points, and optionally a base point and a float `alpha`.

### Functionality

The `PointCloud` class provides a suite of functions for handling point clouds in a manifold. These include:

- `s_mean`: computes the mean of a set of points in the manifold.
- `s_geodesic`: computes the geodesic between two points in the manifold.
- `s_exp`: computes the exponential map at a point in the manifold.
- `s_log`: computes the logarithm map at a point in the manifold.
- `s_distance`: computes the manifold distance between points.
- `center_mpoint`: centers a set of points in the manifold.
- `align_mpoint`: aligns a set of points to a base point in the manifold.
- `least_orthogonal`: finds the orthogonal transformation that minimizes the sum of squared distances between a set of points and a set of base points in the manifold.
- `orthogonal_transform_mpoint`: applies an orthogonal transformation to a set of points in the manifold.
- `translate_mpoint`: translates a set of points in the manifold by a vector.
- `horizontal_projection_tvector`: projects a tangent vector to the horizontal space.

### Usage

The typical workflow involves initializing an instance of `PointCloud` with the manifold's dimension and number of points. Then, one can use this instance to perform various point cloud operations in the manifold.

```python
cloud = PointCloud(dim=2, numpoints=100)
mean = cloud.s_mean(X)
log = cloud.s_log(x, y)
```

### Development

This class and its methods can be extended to provide additional functionality for working with point clouds in manifold spaces. Computation-intensive operations such as eigenvalue decomposition and matrix operations rely heavily on the `torch` library for efficient execution.