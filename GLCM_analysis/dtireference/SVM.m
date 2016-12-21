clc;
clear;
[label, data] = libsvmread('D:\Program Files\libsvm-3.21\tools\FA');
acc = 0;
% for i = 1:36;
%     train_label = label;
%     train_data = data;
% %     train_label(i,:) = [];
% %     train_data(i,:) = [];
%     test_label = label(i,:);
%     test_data = data(i,:);
% 
%     model = svmtrain(train_label, train_data, '-s 0');
%     %model = svmtrain(label, instance, '-s 0 -c 32 -g 0.0078125 -v 10');
%     [predict_label, accuracy, dec_val] = svmpredict(test_label, test_data, model);
%     acc = acc+accuracy(1,1);
% end
% end_acc = acc/36;


model = svmtrain(label, data, '-s 0 -c 32 -g 0.0078125 -v 10');
%model = svmtrain(label, instance, '-s 0 -c 32 -g 0.0078125 -v 10');
[predict_label, accuracy, dec_val] = svmpredict(label, data, model);