mkdir -p txt wave opus
(cat specialrequests.tsv; tail -n +2 sentences.tsv | sort -u) | parallel --pipe -j 1 -N 1 'cat > txt/{#}.txt'
ls txt/ | parallel --eta -j 1 -N 1 'say -v Fred -o wave/{/.}.wave < txt/{/.}.txt ; opusenc --quiet --bitrate 16 --speech wave/{/.}.wave opus/{/.}.opus ; rm wave/{/.}.wave'
