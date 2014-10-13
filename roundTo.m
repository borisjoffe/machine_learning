function result = roundTo(x, precision)
% Round x to nearest `precision`
% - e.g. round 3.25 to nearest 0.1 would be roundTo(3.25, 0.1)

result = round(x / precision) * precision;

end
