<?php
try {
    $host = "localhost";
    $dbname = "boutique";
    $user = "postgres";
    $password = "sinda"; 

    $pdo = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur connexion: " . $e->getMessage());
}
?>