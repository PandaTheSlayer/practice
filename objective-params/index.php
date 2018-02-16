<?php

    $db = new mysqli('localhost', 'root', '', 'practice_objective');
    $db->set_charset('utf8');
    $res = $db->query("SELECT * FROM `mdl_book` WHERE `course` = '14'");

    while($row = $res->fetch_assoc()){
        $books[] = $row;
    }

    //echo 'Количество лекций курса: ' . count($books);

    $grade_items = $db->query("SELECT * FROM `mdl_grade_items` WHERE `courseid`='14'");

    while($row = $grade_items->fetch_assoc()){
        $items[] = $row;
    }

    //echo json_encode($items, JSON_UNESCAPED_UNICODE);

    $mapper = function($e){
        return [
            'name'   => $e['itemname'],
            'type'   => $e['itemtype'],
            'module' => $e['itemmodule']
        ];
    };

    echo json_encode( array_map($mapper, $items), JSON_UNESCAPED_UNICODE );
