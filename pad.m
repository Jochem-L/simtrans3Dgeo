function output = pad(input,Lout);
  Lin = numel(input);
  if Lin >= Lout
    output = input(:)';
  else
    output = repmat(' ',1,Lout);
    output(1:Lin) = input(:)';
  end
end
