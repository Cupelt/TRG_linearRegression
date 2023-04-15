import java.lang.Math;
import java.lang.String;
import java.util.Arrays;

x_train = arrayOf(1, 2, 3)
y_train = arrayOf(2, 4, 6)

#MESSAGE "x_train data = " + Arrays.toString(x_train)
#MESSAGE "y_train data = " + Arrays.toString(y_train)
#MESSAGE ""

W = Math.random()
b = Math.random()

learning_rate = 0.01
epochs = 2000
FOR epoch = 0:epochs
    loss = 0.0
    FOR batch = 0:x_train.length
        h = x_train[batch] * W + b
        loss += Math.pow(h - y_train[batch], 2.0)
    ENDFOR
    loss /= x_train.length

    grad_b = 0.0
    grad_W = 0.0
    FOR batch = 0:y_train.length
        error = ((x_train[batch] * W + b) - y_train[batch])
        grad_b += error
        grad_W += error * x_train[batch]
    ENDFOR

    grad_W /= x_train.length
    grad_b /= x_train.length

    b -= learning_rate * grad_b * 2.0
    W -= learning_rate * grad_W * 2.0
    
    IF (epoch+1) % 200 == 0
        #MESSAGE "Epochs " + String.format("%04d", epoch+1) + "/"+ String.format("%03d", epochs) +" | W : " + String.format("%.5f", W) + ", b :" + String.format("%.5f", b) + ", loss : "+ String.format("%.5f", loss)
    ENDIF
ENDFOR

x_result = 10
#MESSAGE "\nx : " + x_result + " = " + (x_result * W + b)
