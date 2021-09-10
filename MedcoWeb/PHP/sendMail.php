<?php

    require 'PHPMailer/PHPMailerAutoload.php';
    
    //sendmail('medcosystems@gmail.com','testing subject','<h1>yoooo</h1>');

    function sendmail($reciver,$subject,$content){
        $mail = new PHPMailer;
        $mail->isSMTP(); //comment this line when hosting
        $mail->Host='smtp.gmail.com';
        $mail->Port=587;
        $mail->SMTPAuth=true;
        $mail->SMTPSecure='tls';

        $mail->Username='medcosystems@gmail.com';
        $mail->Password='medco@456';

        $mail->setFrom('medcosystems@gmail.com','MEDCO');
        $mail->addAddress($reciver);
        $mail->addReplyTo('medcosystems@gmail.com');

        $mail->isHTML(true);
        $mail->Subject=$subject;
        $mail->Body=$content;
        if(!$mail->send()){
            echo "Message could not be sent";
        }
    }


?>