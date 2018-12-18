function [rawdata, db] = MAIN_example()
fnm = fullfile('..','data','database','database.mat');
load(fnm);
patients = unique(datTabAll.patient);
%return a vector patients of all the unique patient names in datTabAll.patient
areas = {'lfp','ecog'};
%areas are the columns you are interested in in datTabAll
for p = 1:length(patients)
    patidx  = strcmp(datTabAll.patient,patients{p});
    %return a vector patidx of the locations in datTabAll.patient for a single
    %patient's name patient{p}
    taskidx = strcmp(datTabAll.task,'rest');
    %return a vector taskidx of all the locations in datTabAll.task of the
    %task 'rest'
    idxuse   = patidx & taskidx;
    %return a vecotr idxuse of all the locations where both patidx &
    %taskidx are true; i.e. all the instances where a single patient
    %patients{p} has the tast 'rest'
    %db = datTabAll(idxuse,:);
    db.patients{p} = datTabAll(idxuse,:);%?JA would this make a column in
    %   db for each patients{p}?
    % 
    %
    %instantiate db as a matrix with the first dimension is the same as
    %idxuse (and thus the first dimensional locations (rows) corresponding
    %to all patient{p} 'rest' rows, and takes all the second second
    %dimension column data (all the columns in a patient{p} row. So you get
    %a single patient matrix of all the
    %'rest' rows.
    for s = 1:size(db,1)
        %for each row in db (thus each of patient{p} 'rest' tasks
        for a = 1:length(areas)
            %for each column data of interest
            rawdata = db.(areas{a}){s};
            %instantiate a new thing 'rawdata' which is the contents of the
            %cell corresponding to the column data of interest for each
            %instance of patient{p} 'rest' tasks
        end
    end
end
end
