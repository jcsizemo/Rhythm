function rym2ry(rymfile)

fid = fopen(rymfile);
tline = fgets(fid);







CellTrack = [];
TrackNum = 0;
while ischar(tline)
    if(strfind(tline,'Track'))
        if TrackNum ~=0
            CellTrack{TrackNum} = ArrayOneTrack;
        end
        TrackNum = TrackNum+1;
        ArrayOneTrack = [];
        count = 1;
    else
        nums = str2num(tline);
        if isempty(nums)
            
        else
            ArrayOneTrack(count,1) = nums(1);
            ArrayOneTrack(count,2) = nums(2);
            count = count+1;
            fprintf('%d,%d\n',nums(1),nums(2));
        end
        
    end
    tline = fgets(fid);
end



firstcount = 0;
n = 1;
for ci = 1:length(CellTrack)
    Array = CellTrack{ci};
    count_min = Array(1,1);
    Array(:,1) = Array(:,1)-count_min+1;
    count_max = Array(end,1);
    Array_str_cell = [];
    for i = 1:count_max
        ind = find(Array(:,1)==i);
        if isempty(ind)
            Array_str_cell{i} = 'rest';
        elseif  length(ind)== 1
            Array_str_cell{i} = int2note(Array(ind,2));
        else
            IntNotes = Array(ind,1);
            strprint = '';
            for ii = 1:length(IntNotes)
                if ii==1
                    strprint = sprintf('[%s',int2note(IntNotes(ii))) ;
                elseif ii == length(IntNotes)
                    strprint = sprintf('%s,%s]',strprint,int2note(IntNotes(ii))) ;
                else
                    strprint = sprintf('%s,%s',strprint,int2note(IntNotes(ii))) ;
                end
            end
            Array_str_cell{i} = strprint;
        end
    end
end
end



function note = int2note(x)

IntToNoteTable = {0,'A';...
    1,'A#';...
    2,'B';...
    3,'C';...
    4,'C#';...
    5,'D';...
    6,'D#';...
    7,'E';...
    8,'F';...
    9,'F#';...
    10,'G';...
    11,'G#'};

num1 = mod(x,12);
num2 = floor(x/12);

note = sprintf('%s%d',IntToNoteTable{num1+1,2},num2);

end