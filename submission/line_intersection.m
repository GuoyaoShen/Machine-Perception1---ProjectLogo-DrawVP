function [pt] = line_intersection(l1, l2)
%line_intersection - compute the intersection of two lines
% Arguments
%   l1 - first line in homogenous coordinates
%   l2 - second line in homogenous coordinates
% Returns
%   pt - intersection point in normalized homogenous coordinates
%         if it is a point at infinity don't normalize

% l1=[a1;
%     b1;
%     c1];
% l2=[a2;
%     b2;
%     c2];

%cross product
pt=cross(l1,l2);
%normalize
if pt(3)~=0
    pt(1)=pt(1)/pt(3);
    pt(2)=pt(2)/pt(3);
    pt(3)=1;
end
end
