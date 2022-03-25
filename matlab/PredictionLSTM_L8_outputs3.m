clear all;
clc;


load Prediction_onehot_LSTM_L8_o1_outputs3_N16.mat
load Prediction_onehot_LSTM_L8_o1_outputs3_N64.mat
load Prediction_onehot_LSTM_L8_o1_outputs3_N256.mat

%%%%%%%%%%%%%% LSTM N=16 %%%%%%%%%%%%%%%%%%%%%%%%


prob_seq_LSTM_L8_outputs3_N16 = Prediction_onehot_LSTM_L8_o1_outputs3_N16(1,:);
combination_LSTM_L8_outputs3_N16 = Prediction_onehot_LSTM_L8_o1_outputs3_N16(2,:);
firstcell_N16 = Prediction_onehot_LSTM_L8_o1_outputs3_N16(3,:);
secondcell_N16 = Prediction_onehot_LSTM_L8_o1_outputs3_N16(4,:);
thirdcell_N16 = Prediction_onehot_LSTM_L8_o1_outputs3_N16(5,:);

Pred_firstCell_N16 = sum(prob_seq_LSTM_L8_outputs3_N16.*firstcell_N16).*100;
Pred_secondCell_N16 = sum(prob_seq_LSTM_L8_outputs3_N16.*secondcell_N16).*100;
Pred_thirdCell_N16 = sum(prob_seq_LSTM_L8_outputs3_N16.*thirdcell_N16).*100;
Pred_Combination_N16 = sum(prob_seq_LSTM_L8_outputs3_N16.*combination_LSTM_L8_outputs3_N16).*100;

%%%%%%%%%%%%%% LSTM N=64 %%%%%%%%%%%%%%%%%%%%%%%%

prob_seq_LSTM_L8_outputs3_N64 = Prediction_onehot_LSTM_L8_o1_outputs3_N64(1,:);
combination_LSTM_L8_outputs3_N64 = Prediction_onehot_LSTM_L8_o1_outputs3_N64(2,:);
firstcell_N64 = Prediction_onehot_LSTM_L8_o1_outputs3_N64(3,:);
secondcell_N64 = Prediction_onehot_LSTM_L8_o1_outputs3_N64(4,:);
thirdcell_N64 = Prediction_onehot_LSTM_L8_o1_outputs3_N64(5,:);

Pred_firstCell_N64 = sum(prob_seq_LSTM_L8_outputs3_N64.*firstcell_N64).*100;
Pred_secondCell_N64 = sum(prob_seq_LSTM_L8_outputs3_N64.*secondcell_N64).*100;
Pred_thirdCell_N64 = sum(prob_seq_LSTM_L8_outputs3_N64.*thirdcell_N64).*100;
Pred_Combination_N64 = sum(prob_seq_LSTM_L8_outputs3_N64.*combination_LSTM_L8_outputs3_N64).*100;


%%%%%%%%%%%%%% LSTM N=256 %%%%%%%%%%%%%%%%%%%%%%%%

prob_seq_LSTM_L8_outputs3_N256 = Prediction_onehot_LSTM_L8_o1_outputs3_N256(1,:);
combination_LSTM_L8_outputs3_N256 = Prediction_onehot_LSTM_L8_o1_outputs3_N256(2,:);
firstcell_N256 = Prediction_onehot_LSTM_L8_o1_outputs3_N256(3,:);
secondcell_N256 = Prediction_onehot_LSTM_L8_o1_outputs3_N256(4,:);
thirdcell_N256 = Prediction_onehot_LSTM_L8_o1_outputs3_N256(5,:);

Pred_firstCell_N256 = sum(prob_seq_LSTM_L8_outputs3_N256.*firstcell_N256).*100;
Pred_secondCell_N256 = sum(prob_seq_LSTM_L8_outputs3_N256.*secondcell_N256).*100;
Pred_thirdCell_N256 = sum(prob_seq_LSTM_L8_outputs3_N256.*thirdcell_N256).*100;
Pred_Combination_N256 = sum(prob_seq_LSTM_L8_outputs3_N256.*combination_LSTM_L8_outputs3_N256).*100;

%%%%%%%%%%%%%%% figure %%%%%%%%%%%%%%%%%%%%

graph = [Pred_firstCell_N16 Pred_firstCell_N64 Pred_firstCell_N256;
         Pred_secondCell_N16 Pred_secondCell_N64 Pred_secondCell_N256;
         Pred_thirdCell_N16 Pred_thirdCell_N64 Pred_thirdCell_N256;];


figure;

H = bar(graph,'BarWidth', 1.0);

% colors bars
myC= [0.1 0.5 0.9];
k = 1
 set(H(k),'facecolor',myC(k,:))

myC2= [0 1 1];
set(H(2),'facecolor', myC2(1,:)) 

myC3= [0.1 1 0.1];
set(H(3),'facecolor', myC3(1,:))

xt = get(gca, 'XTick');

set(gca, 'XTick', xt, 'XTickLabel', {'c^{6}', 'c^{7}', 'c^{8}'})


aa = {'LSTM - N = 16', 'LSTM - N = 64', 'LSTM - N = 256'}
legend(aa)


ylabel('Prediction Performance (PP) (%)');
ylim([0 100])
xlim([0.5 3.5])
grid on;