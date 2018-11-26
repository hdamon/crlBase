function [RDM, MAG] = matrixRDMandMAG(matA,matB)
% Compute RDM and MAG across rows of a matrix
%
% function [RDM,MAG] = matrixRDM(matA,matB)
%
%

assert(all(size(matA)==size(matB)),...
          'Matrices must be the same size!');

matANrms = sqrt(sum(matA.^2,2));
matAInvNrms = 1./matANrms;
matAInvNrms(isinf(matAInvNrms)|isnan(matAInvNrms)) = 0;

matBNrms = sqrt(sum(matB.^2,2));
matBInvNrms = 1./matBNrms;
matBInvNrms(isinf(matBInvNrms)|isnan(matBInvNrms)) = 0;

MAG = matANrms./matBNrms;

matA = spdiags(matAInvNrms(:),0,size(matA,1),size(matA,1))*matA;
matB = spdiags(matBInvNrms(:),0,size(matB,1),size(matB,1))*matB;

RDM = sqrt(sum((matA-matB).^2,2));

end

