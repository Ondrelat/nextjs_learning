import { dictation } from '@prisma/client';
import React, { useRef, useLayoutEffect, useState, useEffect } from 'react';
import Image from 'next/image';

interface AudioProps {
  dictation: dictation;
  audioIndexParam: number;
  totalParts: number;
}

export default function Audio({ dictation, audioIndexParam, totalParts }: AudioProps) {
  const [audioIndex, setAudioIndex] = useState(audioIndexParam);
  const [isPlaying, setIsPlaying] = useState(false);
  const [currentPart, setCurrentPart] = useState(1);
  const [progress, setProgress] = useState(0);
  const [playbackRate, setPlaybackRate] = useState(1);
  const [volume, setVolume] = useState(1);
  const [isPlaybackRateOpen, setIsPlaybackRateOpen] = useState(false);
  const [isVolumeOpen, setIsVolumeOpen] = useState(false);

  const audioRef = useRef<HTMLAudioElement>(null);
  const audioSrc = `${dictation.audio_url}/${dictation.title.replace(/ /g, '_')}_partie_${audioIndex}.mp3`;

  useEffect(() => {
    setAudioIndex(audioIndexParam);
  }, [audioIndexParam]);

  useEffect(() => {
    const audio = audioRef.current;

    const handleTimeUpdate = () => {
      if (audio) {
        const progress = (audio.currentTime / audio.duration) * 100;
        setProgress(progress);

        const partDuration = audio.duration / totalParts;
        const currentPart = Math.floor(audio.currentTime / partDuration) + 1;
        setCurrentPart(currentPart);
      }
    };

    if (audio) {
      audio.addEventListener('timeupdate', handleTimeUpdate);
    }

    return () => {
      if (audio) {
        audio.removeEventListener('timeupdate', handleTimeUpdate);
      }
    };
  }, [totalParts]);

  const togglePlay = () => {
    const audio = audioRef.current;
    if (audio) {
      if (isPlaying) {
        audio.pause();
      } else {
        audio.play();
      }
      setIsPlaying(!isPlaying);
    }
  };

  const handleNextAudio = () => {
    if (audioIndex < totalParts) {
      setAudioIndex(prevIndex => prevIndex + 1);
    }
  };

  const handlePreviousAudio = () => {
    if (audioIndex > 1) {
      setAudioIndex(prevIndex => prevIndex - 1);
    }
  };

  const togglePlaybackRate = () => {
    setIsPlaybackRateOpen(!isPlaybackRateOpen);
  };

  const changePlaybackRate = (rate: number) => {
    audioRef.current.playbackRate = rate;
    setPlaybackRate(rate);
    setIsPlaybackRateOpen(false);
  };

  const toggleVolume = () => {
    setIsVolumeOpen(!isVolumeOpen);
  };

  const changeVolume = (event: React.ChangeEvent<HTMLInputElement>) => {
    const newVolume = parseFloat(event.target.value);
    audioRef.current.volume = newVolume;
    setVolume(newVolume);
  };

  useEffect(() => {
    const audio = audioRef.current;
    if (audio) {
      audio.pause();
      audio.load();
      audio.play();
      setIsPlaying(true);
    }
  }, [audioIndex]);

  if (dictation && dictation.audio_url) {
    return (
      <div className="relative">
        <div className="flex items-center justify-center">
          <div className="absolute inset-0 flex items-center justify-center z-0">
            <Image src="/images/micro.jpg" width={500} height={460} alt="Image de microphone pour l'audio de la dictée" className="responsive-image opacity-50" />
          </div>
          <div className="w-96 bg-white p-5 rounded shadow-md z-10">
            <audio ref={audioRef} src={audioSrc} className="w-full mb-4"></audio>
            <div className="flex items-center justify-between mb-4">
              <button
                className="flex items-center justify-center w-12 h-12 rounded-full bg-green-500 text-white focus:outline-none"
                onClick={togglePlay}
              >
                {isPlaying ? (
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className="w-6 h-6">
                    <path fillRule="evenodd" d="M6.75 5.25a.75.75 0 01.75-.75H9a.75.75 0 01.75.75v13.5a.75.75 0 01-.75.75H7.5a.75.75 0 01-.75-.75V5.25zm7.5 0A.75.75 0 0115 4.5h1.5a.75.75 0 01.75.75v13.5a.75.75 0 01-.75.75H15a.75.75 0 01-.75-.75V5.25z" clipRule="evenodd" />
                  </svg>
                ) : (
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className="w-6 h-6">
                    <path fillRule="evenodd" d="M4.5 5.653c0-1.426 1.529-2.33 2.779-1.643l11.54 6.348c1.295.712 1.295 2.573 0 3.285L7.28 19.991c-1.25.687-2.779-.217-2.779-1.643V5.653z" clipRule="evenodd" />
                  </svg>
                )}
              </button>
              <div className="flex items-center flex-grow justify-center">
                <button
                  className="mr-4 focus:outline-none"
                  onClick={handlePreviousAudio}
                  disabled={audioIndex === 1}
                >
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className="w-6 h-6">
                    <path fillRule="evenodd" d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zm-4.28 9.22a.75.75 0 000 1.06l3 3a.75.75 0 101.06-1.06l-1.72-1.72h5.69a.75.75 0 000-1.5h-5.69l1.72-1.72a.75.75 0 00-1.06-1.06l-3 3z" clipRule="evenodd" />
                  </svg>
                </button>
                <div className="text-sm text-gray-600 text-center">
                  Partie {audioIndex}/{totalParts}
                  <br />
                  Durée totale : 1 min
                </div>
                <button
                  className="ml-4 focus:outline-none"
                  onClick={handleNextAudio}
                  disabled={audioIndex === totalParts}
                >
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className="w-6 h-6">
                    <path fillRule="evenodd" d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zm4.28 10.28a.75.75 0 000-1.06l-3-3a.75.75 0 10-1.06 1.06l1.72 1.72H8.25a.75.75 0 000 1.5h5.69l-1.72 1.72a.75.75 0 101.06 1.06l3-3z" clipRule="evenodd" />
                  </svg>
                </button>
              </div>
              <div className="flex items-center">
                <div className="relative">
                  <button
                    className="focus:outline-none"
                    onClick={togglePlaybackRate}
                  >
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className="w-6 h-6">
                      <path fillRule="evenodd" d="M10.5 6a1.5 1.5 0 113 0 1.5 1.5 0 01-3 0zm0 6a1.5 1.5 0 113 0 1.5 1.5 0 01-3 0zm0 6a1.5 1.5 0 113 0 1.5 1.5 0 01-3 0z" clipRule="evenodd" />
                    </svg>
                  </button>
                  {isPlaybackRateOpen && (
                    <div className="absolute right-0 mt-2 w-40 bg-white rounded-md shadow-lg z-10">
                      <button
                        className="w-full px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-gray-900"
                        onClick={() => changePlaybackRate(0.5)}
                      >
                        0.5x
                      </button>
                      <button
                        className="w-full px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-gray-900"
                        onClick={() => changePlaybackRate(1)}
                      >
                        1x
                      </button>
                      <button
                        className="w-full px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-gray-900"
                        onClick={() => changePlaybackRate(1.5)}
                      >
                        1.5x
                      </button>
                      <button
                        className="w-full px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-gray-900"
                        onClick={() => changePlaybackRate(2)}
                      >
                        2x
                      </button>
                    </div>
                  )}
                </div>
                <div className="relative ml-4">
                  <button
                    className="focus:outline-none"
                    onClick={toggleVolume}
                  >
                    {volume === 0 ? (
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className="w-6 h-6">
                        <path d="M13.5 4.06c0-1.336-1.616-2.005-2.56-1.06l-4.5 4.5H4.508c-1.141 0-2.318.664-2.66 1.905A9.76 9.76 0 001.5 12c0 .898.121 1.768.35 2.595.341 1.24 1.518 1.905 2.659 1.905h1.93l4.5 4.5c.945.945 2.561.276 2.561-1.06V4.06zM17.78 9.22a.75.75 0 10-1.06 1.06L18.44 12l-1.72 1.72a.75.75 0 001.06 1.06l1.72-1.72 1.72 1.72a.75.75 0 101.06-1.06L20.56 12l1.72-1.72a.75.75 0 00-1.06-1.06l-1.72 1.72-1.72-1.72z" />
                      </svg>
                    ) : (
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className="w-6 h-6">
                        <path d="M13.5 4.06c0-1.336-1.616-2.005-2.56-1.06l-4.5 4.5H4.508c-1.141 0-2.318.664-2.66 1.905A9.76 9.76 0 001.5 12c0 .898.121 1.768.35 2.595.341 1.24 1.518 1.905 2.659 1.905h1.93l4.5 4.5c.945.945 2.561.276 2.561-1.06V4.06zM18.584 5.106a.75.75 0 011.06 0c3.808 3.807 3.808 9.98 0 13.788a.75.75 0 11-1.06-1.06 8.25 8.25 0 000-11.668.75.75 0 010-1.06z" />
                        <path d="M15.932 7.757a.75.75 0 011.061 0 6 6 0 010 8.486.75.75 0 01-1.06-1.061 4.5 4.5 0 000-6.364.75.75 0 010-1.06z" />
                      </svg>
                    )}
                  </button>
                  {isVolumeOpen && (
                    <div className="absolute left-0 bottom-10 w-6 h-24 bg-white rounded-md shadow-lg z-10">
                      <input
                        type="range"
                        min="0"
                        max="1"
                        step="0.1"
                        value={volume}
                        onChange={changeVolume}
                        className="w-24 h-2 bg-gray-200 rounded-lg appearance-none rotate-[-90deg] transform origin-[12px_12px] cursor-pointer"
                      />
                    </div>
                  )}
                </div>
              </div>
            </div>
            <div className="w-full h-2 bg-gray-300 rounded">
              <div className="h-full bg-green-500 rounded" style={{ width: `${progress}%` }}></div>
            </div>
          </div>
        </div>
      </div>
    );
  } else {
    return (
      <>
        <p>Le chemin du fichier audio n'est pas disponible.</p>
      </>
    );
  }
}