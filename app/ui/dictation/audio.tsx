
import { dictation } from '@prisma/client'
import React, { useRef, useEffect } from 'react';

interface AudioProps {
    dictation: dictation;
    audioIndex: number;
  }
  
export default function Audio({ dictation, audioIndex }: AudioProps) {

    const audioRef = useRef<HTMLAudioElement>(null);
    const isFirstRender = useRef(true);

    // Construction de l'URL du fichier audio avec encodage des caractères TEST
    const audioSrc = `${dictation.audio_url}/${dictation.title}_partie_${audioIndex}.mp3`;
    console.log("test : " + audioSrc)

    useEffect(() => {
        if (isFirstRender.current) {
            isFirstRender.current = false;
          } else {
            if (audioRef.current) {
              audioRef.current.play();
            }
          }
      }, [audioIndex]);

    if (dictation && dictation.audio_url) {
        return (
            <>
                <audio src="audios/Un_Jour_à_la_Ferme_partie_1.mp3" controls ref={audioRef} className="border-2 border-black rounded-full text-base" />
            </>
        );
    } else {
        // Si dictation ou dictation.audiourl est indéfini, renvoie un composant de remplacement ou un message d'erreur
        return (
            <>
                <p>Le chemin du fichier audio n est pas disponible.</p>
            </>
        );
    }
}

