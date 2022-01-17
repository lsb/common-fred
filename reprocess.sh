(cat specialrequests.tsv; tail -n +2 sentences.tsv | sort -u) | parallel --pipe -j 1 -N 1 'tee txt/{#}.txt | say -v Fred -o wave/{#}.wave'
(cat specialrequests.tsv; tail -n +2 sentences.tsv | sort -u) | parallel --eta -N 1 'opusenc --quiet --bitrate 16 --speech wave/{#}.wave opus/{#}.opus'
