<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <title>Document</title>
</head>
<body>
    <div class="container">
        <?php
        

        $mysqli = new mysqli('localhost', 'root', '', 'practice');
        $mysqli->set_charset('utf8');
        $result = $mysqli->query('SELECT * FROM `mdl_feedback_item` WHERE `feedback`="9"');

        while($row = $result->fetch_assoc()){
            $resultArr[] = $row;
        }

        // resultArr содержит список вопросов к опроснику (выборка делается по уникальному ключу feedback, добытому в таблице mdl_feedback)

        ?>

        <table>
        <tr>
            <th></th>
            <th></th>
            <th></th>
            <th>P</th>
            <th>Nc</th>
        </tr>
        
            <?php
                foreach($resultArr as $key=>$value){
                    $id = $key+1;
                    echo "<tr>";
                        echo "<td>$id</td>";
                        echo "<td>".$value['name']."</td>";

                        $vars = str_replace('r>>>>>', '', $value['presentation']);
                        $vars = explode('|', $vars);
                        $vars_count = count($vars);

                        echo "<td class='vars'>";
                        foreach($vars as $var){
                            echo "<p>$var</p>";
                        }
                        echo "</td>";

                        switch($vars_count){
                            case 2:
                                $weights = "
                                    <input type='number' value='1'><br>
                                    <input type='number' value='0'><br>
                                ";
                                break;
                            case 3:
                                $weights = "
                                    <input type='number' value='1'><br>
                                    <input type='number' value='0.5'><br>
                                    <input type='number' value='0'><br>
                                ";
                                break;
                            case 4:
                                $weights = "
                                    <input type='number' value='1'><br>
                                    <input type='number' value='0.7'><br>
                                    <input type='number' value='0.3'><br>
                                    <input type='number' value='0'><br>
                                    ";
                                break;
                        }

                        echo "<td>$weights</td>";

                    echo "</tr>";
                }
            ?>
        
        </table>
    </div>
</body>
</html>
    

    
