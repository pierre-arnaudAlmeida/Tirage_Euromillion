WITH Ada.Text_Io; USE Ada.Text_IO;
WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO;
WITH Ada.Numerics.Discrete_Random;

PROCEDURE Tirage_Euromillion IS

SUBTYPE Chiffre IS Integer RANGE 1..49; -- chiffres normaux
Subtype Etoile is integer range 1..10; -- ?toiles
   PACKAGE TournerBoule IS NEW Ada.Numerics.Discrete_Random (Chiffre);
      USE TournerBoule;
   G:Generator;

   -- Debut fonction Donn?e les boules normale
   FUNCTION TournerB (G: Generator) RETURN Chiffre IS
   BEGIN
      RETURN Random(G);
   END TournerB;
   -- fin de TournerB, qui donne les boules normale


   TYPE GrilleB IS ARRAY (1..5) OF Chiffre; -- declaration des tableaux des boule normales
   TYPE GrilleE IS ARRAY (1..2) OF Etoile; -- declaration du tableaux des etoiles

   B : GrilleB;
   E : GrilleE;

-- Creation d'un affiche boule et affectation dans le tableau GrilleB
   PROCEDURE AfficherBoule (B : IN OUT GrilleB) IS
  x : integer;
   BEGIN
      Put("Les Boules tirer, sont les suivantes, elles ont ete tirer dans ce meme ordre");New_line;

      FOR I IN B'RANGE LOOP
         X := TournerB(G);
         B(I) := X;
         Put(B(I));
         Reset(G);
      END LOOP;
   END AfficherBoule;

-- Creation d'un affiche etoile et affectation dans le tableau GrilleE
   PROCEDURE AfficherEtoile (E : IN OUT GrilleE) IS
  y : integer;
   BEGIN
      Put("Les Etoiles tirer, sont les suivantes, elles ont ete tirer dans ce meme ordre");New_line;

      FOR J IN E'RANGE LOOP
         Y := TournerB(G);
         IF Y >= 10
               THEN E(J) := Y;

         END IF;

         Put(E(J));
         Reset(G);
      END LOOP;
   END AfficherEtoile;

BEGIN
   Reset(G);
   AfficherBoule(B);
   New_line;
   AfficherEtoile(E);
   end Tirage_Euromillion;

















