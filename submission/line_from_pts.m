function [l] = line_from_pts(p1, p2)
% line_from_pts - compute a line from two points
%  Arguments
%    p1 - first point in homogenous coordinates
%    p2 - second point in homogenous coordinates
% Returns
%  l - line in homogenous coordinates

% p1=[p1x;
%     p1y;
%     1];
% p2=[p2x;
%     p2y;
%     1];

%cross product
l=cross(p1,p2);
%normalize
l=l/sqrt(l(1)*l(1)+l(2)*l(2));

%play_video(processed_imgs)
end

