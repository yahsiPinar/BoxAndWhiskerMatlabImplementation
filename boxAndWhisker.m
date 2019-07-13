function [median, minVal, maxVal]= boxAndWhisker(dataset, constant)
    
    popArray= reshape(dataset,1,[] ); 
    localPopulation= sort(popArray);
    % finding median
    medianIndex= (1+ length(localPopulation))/2;
    if (isinteger(medianIndex))
        median= (localPopulation(medianIndex));
        %finding Quartiles 
        % Q1
        lowPop= localPopulation(localPopulation<median);
        Q1Index= (1+ length(lowPop))/2;
        if (isinteger(Q1Index))
            Q1= (lowPop(Q1Index));
        else
            lowQ1= floor(Q1Index);
            upQ1= ceil(Q1Index);
            Q1= (lowPop(lowQ1)+ lowPop(upQ1))/2;
        end
        %Q3
        upPop=  localPopulation(localPopulation>median);
        Q3Index= (1+ length(upPop))/2;
        if (isinteger(Q3Index))
            Q3= (upPop(Q3Index));
        else
            lowQ3= floor(Q3Index);
            upQ3= ceil(Q3Index);
            Q3= (upPop(lowQ3)+ upPop(upQ3))/2;
        end
    else
        %Q1
        lowMedian= floor(medianIndex);
        upMedian= ceil(medianIndex);
        median= (localPopulation(lowMedian)+ localPopulation(upMedian))/2;
        lowPop= localPopulation(localPopulation<median);
        Q1Index= (1+ length(lowPop))/2;
        if (isinteger(Q1Index))
            Q1= (lowPop(Q1Index));
        else
            lowQ1= floor(Q1Index);
            upQ1= ceil(Q1Index);
            Q1= (lowPop(lowQ1)+ lowPop(upQ1))/2;
        end
        %Q3
        upPop=  localPopulation(localPopulation>median);
        Q3Index= (1+ length(upPop))/2;
        if (isinteger(Q3Index))
            Q3= (upPop(Q3Index));
        else
            lowQ3= floor(Q3Index);
            upQ3= ceil(Q3Index);
            Q3= (upPop(lowQ3)+ upPop(upQ3))/2;
        end
    end
    IQR= Q3-Q1;
    minVal= max(Q1- constant*IQR,min(popArray));
    maxVal= min(max(popArray),Q3+ constant*IQR);
end