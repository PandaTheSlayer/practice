<?php

error_reporting(E_ALL);
ini_set("display_errors", 1);
$db = new mysqli('localhost', 'root', '', 'practice_objective');
$db->set_charset('utf8');
$course_id = $_GET['id'];

// $sections = toAssocArray(
//     $db->query("SELECT `section`, `name` FROM `mdl_course_sections` WHERE `course` = $course_id")
// );

jsonBeautyPrint(getBooksWithChapters($course_id, $db));

$db->close();

/**
 * Преобразует mysqli result в ассоциативный массив.
 */
function toAssocArray($result){
    if($result->num_rows == 0){
        return null;
    }
    while($row = $result->fetch_assoc())
        $arr[] = $row;
    return $arr;
}

/**
 * Преобразует mysqli result в массив строк.
 */
function toStringArray($result){
    
    if($result->num_rows == 0)
        return null;

    while($row = $result->fetch_row()){
        $arr[] = $row[0];
    }
    
    return $arr;
}

/**
 * Выводит человекопонятное представление массива.
 */
function arrayBeautyPrint(array $arr){
    echo "<pre>";
    print_r($arr);
    echo "</pre>";
}

/**
 * Выводит человекопонятное представление массива в json формате.
 */
function jsonBeautyPrint($arr){
    header("Content-type: application/json");
    echo json_encode($arr, JSON_UNESCAPED_UNICODE);
}

/**
 * Возвращает список книг курса вместе с главами.
 */
function getBooksWithChapters(int $courseid, $db) {
    $books = toAssocArray( 
        $db->query("SELECT `id`, `course`, `name` FROM `mdl_book` WHERE `course`=$courseid")
    );

    if($books == null)
        die("У выбранного курса нет книг!");

    foreach ($books as &$book) {
        $chapters = $db->query("SELECT `title` FROM `mdl_book_chapters` WHERE bookid=".$book['id']);
        $chapters = toStringArray($chapters);
        $book['chapters'] = $chapters;
    }
    
    return $books;
}