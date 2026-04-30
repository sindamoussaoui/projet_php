<?php
session_start();
include("config.php");

// Ajouter au panier
if (isset($_POST['add'])) {
    $id = $_POST['id'];
    $qte = $_POST['qte'];
    $_SESSION['panier'][$id] = ($_SESSION['panier'][$id] ?? 0) + $qte;
    header("Location: panier.php"); exit();
}

// Supprimer un produit
if (isset($_GET['delete'])) {
    unset($_SESSION['panier'][$_GET['delete']]);
    header("Location: panier.php"); exit();
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Mon Panier</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>🛒 Votre Panier</h1>
    <a href="index.php">⬅ Continuer les achats</a>
    <?php
    $total = 0;
    if (!empty($_SESSION['panier'])) {
        echo "<table><tr><th>Produit</th><th>Qté</th><th>Total</th><th>Action</th></tr>";
        foreach ($_SESSION['panier'] as $id => $qte) {
            $stmt = $pdo->prepare("SELECT * FROM produits WHERE id=?");
            $stmt->execute([$id]);
            $p = $stmt->fetch();
            $sousTotal = $p['prix'] * $qte;
            $total += $sousTotal;
            echo "<tr>
                <td>{$p['nom']}</td>
                <td>$qte</td>
                <td>$sousTotal DT</td>
                <td><a href='?delete=$id'>❌</a></td>
            </tr>";
        }
        echo "</table><h3>Total Général: $total DT</h3>";
        echo "<form action='commande.php' method='POST'><button type='submit'>✅ Valider la commande</button></form>";
    } else {
        echo "<p>Le panier est vide.</p>";
    }
    ?>
</body>
</html>