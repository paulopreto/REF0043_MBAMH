load FFS_edit.csv
load RFS_edit.csv

fz_FFS =  (-1 * FFS_edit(:,5)) / (84*9.81);
fz_RFS =  (-1 * RFS_edit(:,5)) / (84*9.81);

plot(fz_FFS)
hold on
plot(fz_RFS)

idx_fz_RFS = find(fz_RFS > 0);
idx_fz_FFS = find(fz_FFS > 0);

FFS_fz = fz_FFS(idx_fz_FFS,:);
RFS_fz = fz_RFS(idx_fz_RFS,:);

figure
plot(FFS_fz)
hold on
plot(RFS_fz,'r')