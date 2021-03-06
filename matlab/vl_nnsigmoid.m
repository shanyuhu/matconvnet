function Y = vl_nnsigmoid(X,dzdY)
% VL_NNSOFTMAX  CNN softmax
%    Y = VL_NNSOFTMAX(X) applies the softmax operator the data X. X
%    has dimension H x W x D x N, packing N arrays of W x H
%    D-dimensional vectors.
%
%    D can be thought of as the number of possible classes and the
%    function computes the softmax along the D dimension. Often W=H=1,
%    but this is not a requirement, as the operator is applied
%    convolutionally at all spatial locations.
%
%    DZDX = VL_NNSOFTMAX(X, DZDY) computes the derivative DZDX of the
%    CNN output with respect to the input X given the derivative DZDY
%    with respect to the block output Y. DZDX has the same dimension
%    as X.

% Copyright (C) 2014 Andrea Vedaldi.
% All rights reserved.
%
% This file is part of the VLFeat library and is made available under
% the terms of the BSD license (see the COPYING file).

Y = logsig(X);

if nargin <= 1, return ; end

% backward
Y=single(dzdY);
%Y = dzdY.*Y.*(ones(size(X))-Y);
%Y = Y .* bsxfun(@minus, dzdY, sum(dzdY .* Y, 3)) ;
