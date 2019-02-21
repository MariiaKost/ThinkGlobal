<?php
/**
 * Created by PhpStorm.
 * Date: 20.02.2019
 * Time: 8:55
 */

require_once('MoodleRest.php');

$MoodleRest = new MoodleRest('http://192.168.111.40/moodle/webservice/rest/server.php', 'ac4f20eb7b7f1cd725dd9ca85f9b62ac');

// Добавляем пользователя
$params = array(
    "users"=>array(
        array("username"=>"testuser", "firstname"=>"Василий", "lastname"=>"Пупкин", "email"=>"blabla@ukr.net", "password"=>"Pupkin*123")
    )
);

$result_add_user = $MoodleRest->request('core_user_create_users', $params);

// Зачисляем пользователя на курс
$params = array(
    "enrolments"=>array(
        array("roleid"=>5, "userid"=>$result_add_user[0][id], "courseid"=>2)
    )
);

$MoodleRest->request('enrol_manual_enrol_users', $params);

