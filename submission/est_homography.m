function [ H ] = est_homography(video_pts, logo_pts)
% est_homography estimates the homography to transform each of the
% video_pts into the logo_pts
% Inputs:
%     video_pts: a 4x2 matrix of corner points in the video
%     logo_pts: a 4x2 matrix of logo points that correspond to video_pts
% Outputs:
%     H: a 3x3 homography matrix such that logo_pts ~ H*video_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% YOUR CODE HERE

% video_pts -- x
% [ax1,ay1;
%  ax2,ay2;
%  ax3,ay3;
%  ax4,ay4]

% logo_pts -- x'
% [ax1',ay1';
%  ax2',ay2';
%  ax3',ay3';
%  ax4',ay4']
video_pts = video_pts';
logo_pts = logo_pts';

%Initialize and calculate matrix A
A = zeros(8,9);
for i = 1:8
   if(mod(i,2) == 1)  %ax,n = [-x,-y,-1,0,0,0,xx',yx',x']
       n = (i+1) / 2;
       A(i,:)=[-video_pts(n,1),-video_pts(n,2),-1,0,0,0,video_pts(n,1)*logo_pts(n,1),video_pts(n,2)*logo_pts(n,1),logo_pts(n,1)];
   else  %ay,n = [0,0,0,-x,-y,-1,xy',yy',y']
       n = i / 2;
       A(i,:)=[0,0,0,-video_pts(n,1),-video_pts(n,2),-1,video_pts(n,1)*logo_pts(n,2),video_pts(n,2)*logo_pts(n,2),logo_pts(n,2)];
   end
end

% use svd to calculate H
[~,~,V] = svd(A);
H_temp = V(:,9);

% reshape H as 3*3 matrix
H = reshape(H_temp,[3,3]);
H = H';

%play_video(projected_imgs)
end

