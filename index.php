<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <style>
        #myNetwork {
            width: 50%;
            height: 800px;
            
            margin: 0 auto;
        }
    </style>
    <script type="text/javascript" src="node_modules/vis/dist/vis.js"></script>
    <link href="node_modules/vis/dist/vis.css" rel="stylesheet" type="text/css" />
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
        <tr class="header">
            <th>Номер</th>
            <th>Вопрос</th>
            <th>врианты ответа</th>
        </tr>
        
            <?php
                foreach($resultArr as $key=>$value){
                    $id = $key+1;
                    echo "<tr class='question-row'>";
                        echo "<td>$id</td>";
                        echo "<td class='question_name'>".$value['name']."</td>";

                        $vars = str_replace('r>>>>>', '', $value['presentation']);
                        $vars = explode('|', $vars);
                        $vars_count = count($vars);

                        switch($vars_count){
                            case 2:
                                $weights = [
                                    "<input type='number' class='weights' value='1'><br>",
                                    "<input type='number' class='weights' value='0'><br>",
                                ];
                                break;
                            case 3:
                                $weights = [
                                    "<input type='number' class='weights' value='1'><br>",
                                    "<input type='number' class='weights' value='0.5'><br>",
                                    "<input type='number' class='weights' value='0'><br>",
                                  ];
                                break;
                            case 4:
                                $weights = [
                                    "<input type='number' class='weights' value='1'><br>",
                                    "<input type='number' class='weights' value='0.7'><br>",
                                    "<input type='number' class='weights' value='0.3'><br>",
                                    "<input type='number' class='weights' value='0'><br>",
                                    ];
                                break;
                        }

                        echo "<td class='vars'>";
                        foreach($vars as $var){
                            echo "<div class='input-data'>";
                            echo "<p class=''>$var</p>";
                            echo "<div class='input-group'>";
                            echo "<p><b>Вес:</b></p>";
                            echo $weights[array_search($var, $vars)];
                            echo "<p><b>Количество ответов:</b></p>";
                            echo "<input type='number' class='answers' value='0'>";
                            echo "</div></div>";
                        }
                        echo "</td>";

                    echo "</tr>";
                }
            ?>
        
        </table>
    </div>
    <button class='btn btn-primary' id='draw-btn'>Вывести граф</button>
    <div id="myNetwork"></div>
    <script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  <script src="main.js"></script>
</body>
</html>
    

    
