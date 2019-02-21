<?php
/**
 * Created by PhpStorm.
 * Date: 20.02.2019
 * Time: 7:28
 */

// Ищет сумму цифр числа
function DigitSum ($number)
{
    $s = 0;
    while ($number > 0)
    {
        $s += $number%10;
        $number = intval($number/10);
    }
    return $s;
}


if ($_POST["submit"] == "OK")
{
    $p = $_POST["p"];
    $count = 0;

    // Рассматриваем наше 2*P-значное число как два P-значных "куска".
    // Для первого куска перебираем все возможные варианты P-значных чисел (от минимального до максимального, увеличивая каждый раз на единицу)
    // и находим количестко чисел с такой же суммой во втором "куске".
    // Второй кусок отличается от первого тем, что может содержать ведушщие нули (т.е. перебор чисел начинаем не с 10 в степени (P-1), а с 1.


    // В массиве $CountOfNumvers4Sum будем хранить количество чисел во втором "куске" для каждой суммы цифр, чтоб не пересчитывать его потом повторно
    //Ключ массива - сумма цифр числа, значение - количество таких чисел
    $CountOfNumvers4Sum = array();

    $last_number = pow(10,$p)-1;
    for ($i=pow(10,$p-1); $i<=$last_number; $i++)
    {
        $sum = DigitSum($i);
        if (isset($CountOfNumvers4Sum[$sum])) //Если мы уже вычисляли количество вариантов "второго куска" для этой суммы, просто суммируем их
        {
            $count += $CountOfNumvers4Sum[$sum];
        }
        else
         {
             $count_for_array = 0;
            for ($k = 1; $k <= $last_number; $k++)
            {
                if ($sum === DigitSum($k))
                {
                    $count++;
                    $count_for_array++;
                }
            }
            $CountOfNumvers4Sum[$sum] = $count_for_array;
        }
    }


    print "<br><p align='center'><font face='Arial'>Кількість ".(2*$p)."-значних чисел, для яких сума перших $p десятичних цифр дорівнює сумі останніх $p десятичних цифр: $count</font></p>";
}
?>

<br>
<table cellspasing="5" cellpadding = "5" border="0" align="center">
    <tr>
        <td>
            <form name="f" method = "post" action="<?php print basename($_SERVER["PHP_SELF"]) ?>">
                <font face='Arial'>
                Введіть значення P:<br>
                <input type="text" name="p" value="" size="2"><br><br>
                <input type="submit" name="submit" value="OK">
                </font>
            </form>
        </td>
    </tr>
</table>
