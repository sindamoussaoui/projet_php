
<?php
try {
    $pdo = new PDO("pgsql:host=localhost;port=5432;dbname=postgres", "postgres", "sinda");
    echo "Connexion réussie ✅";
} catch (PDOException $e) {
    echo "Erreur: " . $e->getMessage();
}
?>