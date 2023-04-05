# vsn operator

#### Description
`vsn` operator performs a normalization factor per column (i.e. sample).

##### Usage
Input projection|.
---|---
`row`   | represents the genes
`col`   | represents the samples
`y-axis`             | is the input data for which to normalization


Output relations|.
---|---
`norm`| numeric, the normalized values of the measurements (i.e. of each sample)

##### Details
The operator is the `justvsn` function from the VSN bioconductor package.


#### References
see the `vsn` R package for the documentation.
