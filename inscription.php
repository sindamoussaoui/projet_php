<?php
include("config.php");
if (isset($_POST['valider'])) {
    $pass = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $stmt = $pdo->prepare("INSERT INTO users (nom, email, password) VALUES (?, ?, ?)");
    $stmt->execute([$_POST['nom'], $_POST['email'], $pass]);
    echo "Compte créé ! <a href='login.php'>Connectez-vous</a>";
}
?>
<form method="POST">
    <input type="text" name="nom" placeholder="Nom" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Mot de passe" required>
    <button type="submit" name="valider">S'inscrire</button>
</form>