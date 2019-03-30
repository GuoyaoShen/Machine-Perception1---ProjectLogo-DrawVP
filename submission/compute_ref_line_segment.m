function [vanishing_pt, top_pt, bottom_pt] = compute_ref_line_segment(ref, ll, lr, ur, ul)
% compute_ref_line_segment
%
%  This function finds the end points of the line segment
%   where the ref is located on the field. The results will
%   be used to plot the virtual line onto the field.
%
%  Arguments
%   ref - point of ref on the field
%   ll - lower left point of rectangle in frame
%   lr - lower right point of rectangle in frame
%   ur - upper right point of rectangle in frame
%   ul - upper left point of rectangle in frame
%
%  Returns
%   vanishing_pt - scene vanishing point
%   top_pt - top of ref's line segment
%   bottom_pt - bottom of ref's line segment

vanishing_pt = [];
top_pt  = [];
bottom_pt = [];

%calculate the line at left
line_l=line_from_pts(ll, ul);
%calculate the line at right
line_r=line_from_pts(lr, ur);
%calculate the vanishing point
vanishing_pt=line_intersection(line_l, line_r);

%calculate the top line
line_t=line_from_pts(ur, ul);
%calculate the bottom line
line_b=line_from_pts(lr, ll);
%calculate the ref line
line_ref=line_from_pts(vanishing_pt, ref);
%calculate the ref top point
top_pt=line_intersection(line_t, line_ref);
%calculate the ref bottom point
bottom_pt=line_intersection(line_b, line_ref);
end
