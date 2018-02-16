<?php

    $db = new mysqli('localhost', 'root', '', 'practice_objective');
    $db->set_charset('utf8');
    $res = $db->query("SELECT * FROM `mdl_book` WHERE `course` = '14'");

    $books = resultToAssocArray($res);

    //echo 'Количество лекций курса: ' . count($books);

    $grade_items = $db->query("SELECT * FROM `mdl_grade_items` WHERE `courseid`='14'");

    $items = resultToAssocArray($grade_items);

    //echo json_encode($items, JSON_UNESCAPED_UNICODE);

    $mapper = function($e){
        return [
            'name'   => $e['itemname'],
            'type'   => $e['itemtype'],
            'module' => $e['itemmodule']
        ];
    };

    echo json_encode( array_map($mapper, $items), JSON_UNESCAPED_UNICODE );

    function resultToAssocArray($result){
        while($row = $result->fetch_assoc())
            $arr[] = $row;
        return $arr;
    }