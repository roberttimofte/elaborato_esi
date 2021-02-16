# elaborato_esi

## idee
- prendere l'immagine, da rgb convertirla in scala di grigi.. quindi i difetti si vedranno maggiormente in teoria o per lo meno avranno un colore diverso dal resto della stoffa. Poi fai una media del colore del tessuto.. e ti passi ogni punto della foto.
Se il punto ha un colore simile alla media (con un range di errore dato dall'ombra magari) e simile ai suoi pixel vicini allora è ok.
Altrimenti se tipo trovi un pixel blu e accanto un pixel nero, allora forse c'è un difetto.
- rendere l immagine più "sharp" per evidenziarne i difetti perchè rendendola piu sharp si evidenziano gli edge.

## note

- il file lab6.m è da utilizzare come spunto, il file di riferimento per il progetto è main.m
- glp.m è un file utilizzato da lab6.m

## risorse
- https://it.mathworks.com/help/images/ref/graythresh.html
- https://www.youtube.com/watch?v=QDpkjsBGLRo
- https://github.com/matteomarzio/ESI-Progetto-Difetti
- https://www.cottonworks.com/resources/defects-glossary/
- https://www.youtube.com/watch?v=O5uDOsm18Bw&t=61s
- https://www.youtube.com/watch?v=0Mr_GVe6WiE&t=14s
- https://www.youtube.com/watch?v=Zy3lmkxlSY0
- https://www.youtube.com/watch?v=TlU8f8VeEhU&feature=youtu.be