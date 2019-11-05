function [Lab,Lab_y] = num_end_de(y,abf)
uniquenum = unique(y);
[e,f]=sort(uniquenum ,'descend');
uniquenum = e;
nuniquenum = size(uniquenum, 1);
pos = uniquenum;
for i=1:nuniquenum
    idx = find(y == uniquenum(i));
    pos(i) = idx(end,1);
end
Lab = pos;
Lab_y = y(Lab);



