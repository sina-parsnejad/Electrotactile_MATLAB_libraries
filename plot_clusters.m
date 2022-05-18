[elements, ~] = size(C);

X= cell(elements,1);
Y= []

for n = 1:elements
    
    X{n} = waveform_LUT(C{n}.', 1:2);
    [Cell_size, ~] = size(X{n});
    A=ones(Cell_size,1)*n;
    X{n} = [X{n} A];
    
    Y = [Y ; X{n}];

end

%hold on
%gscatter(X{n}(:,1),X{n}(:,2),X{n}(:,3));
gscatter(Y(:,1),Y(:,2),Y(:,3));