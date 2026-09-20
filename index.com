 <!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bakso Canteen - Game Bahasa Inggris Kelas 5 SD (Offline)</title>
    <style>
        :root {
            --primary: #059669;
            --primary-dark: #047857;
            --primary-light: #d1fae5;
            --secondary: #f59e0b;
            --secondary-light: #fef3c7;
            --accent: #6366f1;
            --danger: #ef4444;
            --bg-grad-start: #f0fdf4;
            --bg-grad-end: #e0f2fe;
            --text-dark: #1e293b;
            --text-muted: #64748b;
            --font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: var(--font-family);
            user-select: none;
            -webkit-tap-highlight-color: transparent;
        }

        body {
            background: linear-gradient(135deg, var(--bg-grad-start) 0%, var(--bg-grad-end) 100%);
            color: var(--text-dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding-bottom: 2rem;
        }

        header {
            background: rgba(255, 255, 255, 0.92);
            backdrop-filter: blur(8px);
            position: sticky;
            top: 0;
            z-index: 50;
            border-bottom: 2px solid #e2e8f0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .header-container {
            max-w: 1024px;
            max-width: 1000px;
            margin: 0 auto;
            padding: 0.75rem 1rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .brand-icon {
            width: 44px;
            height: 44px;
            background: #f59e0b;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.6rem;
            box-shadow: 0 4px 6px -1px rgba(245, 158, 11, 0.3);
        }

        .brand-title {
            font-size: 1.25rem;
            font-weight: 800;
            color: #065f46;
            line-height: 1.1;
        }

        .brand-sub {
            font-size: 0.75rem;
            font-weight: 700;
            color: #059669;
            margin-top: 2px;
        }

        .stats-bar {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .badge {
            background: #fef3c7;
            border: 1px solid #fde68a;
            border-radius: 9999px;
            padding: 0.25rem 0.75rem;
            display: flex;
            align-items: center;
            gap: 0.35rem;
            font-size: 0.85rem;
            font-weight: 800;
            color: #78350f;
        }

        .badge-green {
            background: #d1fae5;
            border-color: #a7f3d0;
            color: #065f46;
        }

        .btn-icon {
            width: 36px;
            height: 36px;
            background: #f1f5f9;
            border: none;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            color: #475569;
            transition: all 0.2s;
        }

        .btn-icon:hover {
            background: #e2e8f0;
        }

        main {
            max-width: 900px;
            width: 100%;
            margin: 1.5rem auto 0 auto;
            padding: 0 1rem;
            flex-grow: 1;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.88);
            backdrop-filter: blur(10px);
            border: 2px solid rgba(255, 255, 255, 0.6);
            border-radius: 1.5rem;
            padding: 1.5rem;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
        }

        .hero-banner {
            background: linear-gradient(135deg, #059669 0%, #0d9488 100%);
            border-radius: 1.5rem;
            padding: 2rem 1.5rem;
            color: white;
            position: relative;
            overflow: hidden;
            box-shadow: 0 12px 20px -5px rgba(5, 150, 105, 0.3);
            margin-bottom: 1.5rem;
        }

        .hero-tag {
            background: rgba(4, 120, 87, 0.6);
            color: #a7f3d0;
            font-size: 0.7rem;
            font-weight: 800;
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            display: inline-block;
        }

        .hero-title {
            font-size: 1.75rem;
            font-weight: 900;
            margin-top: 0.5rem;
            line-height: 1.2;
        }

        .hero-desc {
            margin-top: 0.5rem;
            font-size: 0.9rem;
            color: #ecfdf5;
            line-height: 1.5;
            max-width: 580px;
        }

        .bg-emoji {
            position: absolute;
            right: -10px;
            bottom: -20px;
            font-size: 8rem;
            opacity: 0.15;
            pointer-events: none;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            font-weight: 800;
            font-size: 0.9rem;
            padding: 0.75rem 1.25rem;
            border-radius: 0.85rem;
            border: none;
            cursor: pointer;
            transition: transform 0.15s ease, background-color 0.2s ease, box-shadow 0.2s ease;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
        }

        .btn:active {
            transform: scale(0.96);
        }

        .btn-amber {
            background: #f59e0b;
            color: #1e293b;
        }
        .btn-amber:hover {
            background: #d97706;
            color: white;
        }

        .btn-green {
            background: #059669;
            color: white;
        }
        .btn-green:hover {
            background: #047857;
        }

        .btn-gray {
            background: #e2e8f0;
            color: #334155;
        }
        .btn-gray:hover {
            background: #cbd5e1;
        }

        .btn-rose {
            background: #f43f5e;
            color: white;
        }
        .btn-rose:hover {
            background: #e11d48;
        }

        .mode-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 1rem;
        }

        .mode-card {
            background: rgba(255, 255, 255, 0.9);
            border: 2px solid #e2e8f0;
            border-radius: 1.25rem;
            padding: 1.25rem;
            display: flex;
            align-items: flex-start;
            gap: 1rem;
            cursor: pointer;
            transition: all 0.2s ease;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.03);
        }

        .mode-card:hover {
            transform: translateY(-4px);
            border-color: #059669;
            box-shadow: 0 10px 15px -3px rgba(0,0,0,0.08);
        }

        .card-icon {
            width: 52px;
            height: 52px;
            border-radius: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            flex-shrink: 0;
        }

        .card-title {
            font-size: 1.05rem;
            font-weight: 800;
            color: #1e293b;
        }

        .card-desc {
            font-size: 0.78rem;
            color: #64748b;
            margin-top: 0.25rem;
            line-height: 1.4;
        }

        .card-action {
            display: inline-block;
            margin-top: 0.6rem;
            font-size: 0.8rem;
            font-weight: 800;
            color: #059669;
        }

        .flashcard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 1rem;
            margin-top: 1rem;
        }

        .flashcard {
            background: white;
            border: 2px solid #e2e8f0;
            border-radius: 1.25rem;
            padding: 1rem;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            gap: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.04);
            transition: transform 0.2s;
        }

        .flashcard:hover {
            transform: translateY(-3px);
            border-color: #10b981;
        }

        .flashcard-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .flashcard-emoji {
            font-size: 2.5rem;
            background: #ecfdf5;
            width: 56px;
            height: 56px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .price-pill {
            background: #fef3c7;
            color: #92400e;
            font-weight: 800;
            font-size: 0.8rem;
            padding: 0.25rem 0.6rem;
            border-radius: 9999px;
        }

        .flashcard-title {
            font-size: 1.1rem;
            font-weight: 800;
            color: #0f172a;
            text-transform: capitalize;
        }

        .flashcard-sub {
            font-size: 0.8rem;
            font-weight: 600;
            color: #64748b;
        }

        .audio-btn {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: #d1fae5;
            color: #047857;
            border: none;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-left: 0.4rem;
        }

        .audio-btn:hover {
            background: #a7f3d0;
        }

        .flashcard-footer {
            background: #f8fafc;
            border: 1px solid #f1f5f9;
            border-radius: 0.75rem;
            padding: 0.5rem 0.75rem;
            font-size: 0.75rem;
        }

        .progress-bar-bg {
            width: 120px;
            height: 10px;
            background: #e2e8f0;
            border-radius: 9999px;
            overflow: hidden;
        }

        .progress-bar-fill {
            height: 100%;
            background: #f59e0b;
            width: 0%;
            transition: width 0.3s ease;
        }

        .options-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            max-width: 500px;
            margin: 1.5rem auto 0 auto;
        }

        @media (max-width: 480px) {
            .options-grid {
                grid-template-columns: 1fr;
            }
        }

        .option-btn {
            background: #f8fafc;
            border: 2px solid #cbd5e1;
            border-radius: 1.25rem;
            padding: 1.25rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            cursor: pointer;
            font-weight: 800;
            font-size: 0.9rem;
            color: #334155;
            transition: all 0.2s;
        }

        .option-btn:hover {
            border-color: #059669;
            background: #ecfdf5;
        }

        .option-btn.correct {
            background: #d1fae5 !important;
            border-color: #10b981 !important;
            color: #065f46 !important;
        }

        .option-btn.wrong {
            background: #ffe4e6 !important;
            border-color: #f43f5e !important;
            color: #881337 !important;
        }

        .customer-bubble {
            display: flex;
            align-items: flex-start;
            gap: 1rem;
        }

        .avatar {
            width: 60px;
            height: 60px;
            background: #fde68a;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.2rem;
            flex-shrink: 0;
            box-shadow: inset 0 2px 4px rgba(0,0,0,0.1);
        }

        .speech-box {
            background: white;
            padding: 1rem 1.25rem;
            border-radius: 1.25rem;
            border-top-left-radius: 0;
            border: 2px solid #e2e8f0;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
            flex-grow: 1;
        }

        .order-display {
            background: #fffbeb;
            border: 2px dashed #fcd34d;
            border-radius: 1.25rem;
            padding: 1.25rem;
            margin: 1.25rem 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .sentence-slots {
            min-height: 70px;
            background: #f8fafc;
            border: 2px dashed #fda4af;
            border-radius: 1.25rem;
            padding: 0.75rem;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            margin: 1rem 0;
        }

        .word-bank {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            padding: 0.5rem 0;
        }

        .word-card {
            background: white;
            border: 2px solid #cbd5e1;
            border-radius: 0.85rem;
            padding: 0.6rem 1rem;
            font-weight: 800;
            font-size: 0.9rem;
            color: #1e293b;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            transition: all 0.2s;
        }

        .word-card:hover {
            border-color: #f43f5e;
            background: #fff1f2;
        }

        .word-card.disabled {
            opacity: 0.3;
            pointer-events: none;
        }

        .word-chip {
            background: #f43f5e;
            color: white;
            border: none;
            border-radius: 0.75rem;
            padding: 0.5rem 0.85rem;
            font-weight: 800;
            font-size: 0.9rem;
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            cursor: pointer;
            box-shadow: 0 3px 6px rgba(244, 63, 94, 0.3);
        }

        .feedback-area {
            min-height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            font-weight: 800;
            font-size: 0.95rem;
            margin-top: 1rem;
        }

        .text-emerald { color: #059669; }
        .text-rose { color: #e11d48; }

        .hidden { display: none !important; }

        canvas#confetti-canvas {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            pointer-events: none;
            z-index: 100;
        }
    </style>
</head>
<body>

    <!-- Canvas for Offline Confetti -->
    <canvas id="confetti-canvas"></canvas>

    <header>
        <div class="header-container">
            <div class="brand">
                <div class="brand-icon">🍲</div>
                <div>
                    <h1 class="brand-title">Bakso Master English</h1>
                    <p class="brand-sub">Kelas 5 SD • Offline Edition</p>
                </div>
            </div>

            <div class="stats-bar">
                <div class="badge">
                    <span>⭐</span>
                    <span id="star-count">0</span>
                </div>
                <div class="badge badge-green">
                    <span>🏆</span>
                    <span id="score-count">0</span>
                </div>
                <button id="sound-btn" onclick="toggleSound()" class="btn-icon" title="Toggle Sound">
                    <svg id="sound-icon-on" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M11 5L6 9H2v6h4l5 4V5zM15.54 8.46a5 5 0 010 7.07M19.07 4.93a10 10 0 010 14.14"></path></svg>
                    <svg id="sound-icon-off" class="hidden" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M11 5L6 9H2v6h4l5 4V5zM23 9l-6 6M17 9l6 6"></path></svg>
                </button>
            </div>
        </div>
    </header>

    <main>
        <section id="screen-home">
            <div class="hero-banner">
                <span class="hero-tag">Unit 3 Bahasa Inggris Kelas 5</span>
                <h2 class="hero-title">Berapa Harga Bakso yang Kamu Makan?</h2>
                <p class="hero-desc">
                    Ayo belajar kata kuantitas (<span style="text-decoration: underline; font-weight:800;">a bowl of, a glass of</span>) dan menyebutkan harga (<span style="text-decoration: underline; font-weight:800;">thousand rupiahs</span>) dalam bahasa Inggris tanpa butuh internet!
                </p>
                <div style="margin-top: 1.25rem;">
                    <button onclick="switchScreen('screen-study')" class="btn btn-amber">
                        📖 Pelajari Menu & Harga
                    </button>
                </div>
                <div class="bg-emoji">🍜</div>
            </div>

            <div class="mode-grid">
                <div onclick="switchScreen('screen-study')" class="mode-card">
                    <div class="card-icon" style="background: #d1fae5; color: #059669;">📚</div>
                    <div>
                        <h3 class="card-title">1. Kamus Canteen</h3>
                        <p class="card-desc">Kosa kata makanan, satuan kuantitas, dan audio pengucapan.</p>
                        <span class="card-action">Buka Kamus &rarr;</span>
                    </div>
                </div>

                <div onclick="startQuizMode()" class="mode-card">
                    <div class="card-icon" style="background: #fef3c7; color: #d97706;">🥣</div>
                    <div>
                        <h3 class="card-title">2. Quantifier Challenge</h3>
                        <p class="card-desc">Tebak gambar makanan sesuai satuan bahasa Inggrisnya.</p>
                        <span class="card-action" style="color: #d97706;">Mainkan Level 1 &rarr;</span>
                    </div>
                </div>

                <div onclick="startCashierMode()" class="mode-card">
                    <div class="card-icon" style="background: #e0e7ff; color: #4f46e5;">👨‍🍳</div>
                    <div>
                        <h3 class="card-title">3. Kasir Warung Bakso</h3>
                        <p class="card-desc">Hitung pesanan pembeli dan jawab "How much is it?".</p>
                        <span class="card-action" style="color: #4f46e5;">Mainkan Level 2 &rarr;</span>
                    </div>
                </div>

                <div onclick="startSentenceMode()" class="mode-card">
                    <div class="card-icon" style="background: #ffe4e6; color: #e11d48;">🧩</div>
                    <div>
                        <h3 class="card-title">4. Susun Kalimat</h3>
                        <p class="card-desc">Susun kata acak menjadi kalimat harga bahasa Inggris yang tepat.</p>
                        <span class="card-action" style="color: #e11d48;">Mainkan Level 3 &rarr;</span>
                    </div>
                </div>
            </div>
        </section>

        <section id="screen-study" class="hidden">
            <div class="glass-card">
                <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 1rem;">
                    <button onclick="switchScreen('screen-home')" class="btn btn-gray">
                        &larr; Menu Utama
                    </button>
                    <h2 style="font-size: 1.2rem; font-weight: 800; color: #065f46;">📚 Kamus Canteen</h2>
                </div>

                <div style="background: #fef3c7; border: 1px solid #fde68a; padding: 0.85rem; border-radius: 1rem; font-size: 0.85rem; color: #78350f; margin-bottom: 1rem;">
                    💡 <strong>Tips Belajar:</strong> Klik ikon audio 🔊 untuk mendengarkan pengucapan Bahasa Inggrisnya!
                </div>

                <div id="flashcards-grid" class="flashcard-grid"></div>
            </div>
        </section>

        <section id="screen-quiz" class="hidden">
            <div class="glass-card" style="text-align: center;">
                <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 1.5rem;">
                    <button onclick="switchScreen('screen-home')" class="btn btn-gray" style="padding: 0.4rem 0.8rem; font-size: 0.8rem;">
                        &larr; Keluar
                    </button>
                    <div style="display: flex; align-items: center; gap: 0.5rem;">
                        <span style="font-size: 0.8rem; font-weight: 800; color: #64748b;">Soal <span id="quiz-current-num">1</span> / <span id="quiz-total-num">5</span></span>
                        <div class="progress-bar-bg">
                            <div id="quiz-progress" class="progress-bar-fill"></div>
                        </div>
                    </div>
                </div>

                <span style="background: #d1fae5; color: #065f46; font-size: 0.75rem; font-weight: 800; padding: 0.3rem 0.8rem; border-radius: 9999px;">
                    Level 1: Quantifiers & Foods
                </span>

                <div style="margin-top: 1rem;">
                    <h3 style="font-size: 1.25rem; font-weight: 800; color: #1e293b;">Manakah yang bernama...</h3>
                    <div style="display: flex; align-items: center; justify-content: center; gap: 0.5rem; margin-top: 0.4rem;">
                        <span id="quiz-target-text" style="font-size: 1.5rem; font-weight: 900; color: #059669;">"a bowl of bakso"</span>
                        <button onclick="speakCurrentQuestion()" class="audio-btn" title="Dengarkan Suara">🔊</button>
                    </div>
                </div>

                <div id="quiz-options-container" class="options-grid"></div>
                <div id="quiz-feedback" class="feedback-area"></div>
            </div>
        </section>

        <section id="screen-cashier" class="hidden">
            <div class="glass-card">
                <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 1rem;">
                    <button onclick="switchScreen('screen-home')" class="btn btn-gray" style="padding: 0.4rem 0.8rem; font-size: 0.8rem;">
                        &larr; Keluar
                    </button>
                    <span style="font-size: 0.8rem; font-weight: 800; color: #4f46e5;">Level 2: Kasir Warung Bakso</span>
                </div>

                <div class="customer-bubble">
                    <div class="avatar">🧑‍🎓</div>
                    <div class="speech-box">
                        <span style="font-size: 0.7rem; font-weight: 800; color: #94a3b8; text-transform: uppercase;">Pembeli Berkata:</span>
                        <div style="display: flex; align-items: center; gap: 0.5rem; margin-top: 0.2rem;">
                            <p id="cashier-dialogue" style="font-size: 1.1rem; font-weight: 800; color: #1e293b;">"Excuse me, how much is a bowl of bakso?"</p>
                            <button onclick="speakCashierDialogue()" class="audio-btn">🔊</button>
                        </div>
                    </div>
                </div>

                <div id="cashier-order-visual" class="order-display"></div>

                <p style="text-align: center; font-weight: 800; font-size: 0.9rem; color: #334155;">Pilih jawaban harga Bahasa Inggris yang tepat:</p>

                <div id="cashier-options-container" style="display: grid; gap: 0.75rem; max-width: 500px; margin: 1rem auto 0 auto;"></div>

                <div id="cashier-feedback" class="feedback-area"></div>
            </div>
        </section>

        <section id="screen-sentence" class="hidden">
            <div class="glass-card">
                <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 1rem;">
                    <button onclick="switchScreen('screen-home')" class="btn btn-gray" style="padding: 0.4rem 0.8rem; font-size: 0.8rem;">
                        &larr; Keluar
                    </button>
                    <span style="font-size: 0.8rem; font-weight: 800; color: #e11d48;">Level 3: Susun Kalimat</span>
                </div>

                <div style="text-align: center;">
                    <span style="background: #ffe4e6; color: #be123c; font-size: 0.75rem; font-weight: 800; padding: 0.3rem 0.8rem; border-radius: 9999px;">
                        Susun Kalimat Yang Benar
                    </span>
                    <h3 id="sentence-translation" style="font-size: 1.2rem; font-weight: 800; color: #1e293b; margin-top: 0.5rem;">
                        "Semangkok bakso harganya sepuluh ribu rupiah."
                    </h3>
                </div>

                <div id="sentence-slots" class="sentence-slots"></div>
                <div id="sentence-wordbank" class="word-bank"></div>

                <div style="display: flex; justify-content: center; gap: 0.75rem; margin-top: 1rem;">
                    <button onclick="resetSentenceSlots()" class="btn btn-gray">
                        🔄 Ulangi
                    </button>
                    <button onclick="checkSentenceAnswer()" class="btn btn-rose">
                        ✔ Periksa Kalimat
                    </button>
                </div>

                <div id="sentence-feedback" class="feedback-area"></div>
            </div>
        </section>

        <section id="screen-result" class="hidden">
            <div class="glass-card" style="text-align: center; max-width: 500px; margin: 0 auto; padding: 2rem 1.5rem;">
                <div style="font-size: 4rem; margin-bottom: 0.5rem;">🏆</div>
                <span style="background: #fef3c7; color: #92400e; font-size: 0.8rem; font-weight: 800; padding: 0.3rem 0.8rem; border-radius: 9999px;">
                    Luar Biasa!
                </span>
                <h2 style="font-size: 1.8rem; font-weight: 900; color: #1e293b; margin-top: 0.5rem;">Selamat, Master Bakso!</h2>
                <p style="font-size: 0.85rem; color: #64748b; margin-top: 0.2rem;">Kamu telah menyelesaikan permainan Bahasa Inggris Kelas 5!</p>

                <div style="background: #ecfdf5; border: 1px solid #a7f3d0; border-radius: 1rem; padding: 1rem; display: flex; justify-content: space-around; margin: 1.5rem 0;">
                    <div>
                        <div style="font-size: 0.7rem; font-weight: 800; color: #64748b;">TOTAL SKOR</div>
                        <div id="final-score" style="font-size: 2rem; font-weight: 900; color: #059669;">100</div>
                    </div>
                    <div style="width: 1px; background: #cbd5e1;"></div>
                    <div>
                        <div style="font-size: 0.7rem; font-weight: 800; color: #64748b;">BINTANG</div>
                        <div id="final-stars" style="font-size: 2rem; font-weight: 900; color: #f59e0b;">⭐ 15</div>
                    </div>
                </div>

                <div style="background: #fef3c7; border: 1px solid #fde68a; padding: 0.75rem; border-radius: 1rem; font-size: 0.8rem; color: #78350f; margin-bottom: 1.5rem;">
                    🏅 <strong>Gelar Diraih:</strong> "Master English Bakso Chef SD Grade 5"
                </div>

                <button onclick="switchScreen('screen-home')" class="btn btn-green" style="width: 100%;">
                    🏠 Ke Menu Utama
                </button>
            </div>
        </section>
    </main>

    <script>
        const FOOD_ITEMS = [
            { id: 'bakso', englishName: 'a bowl of bakso', indonesianName: 'semangkok bakso', price: 10000, priceEnglish: 'ten thousand rupiahs', priceIndonesian: 'Rp 10.000', icon: '🍲' },
            { id: 'mie_ayam', englishName: 'a bowl of mie ayam', indonesianName: 'semangkok mie ayam', price: 12000, priceEnglish: 'twelve thousand rupiahs', priceIndonesian: 'Rp 12.000', icon: '🍜' },
            { id: 'es_teh', englishName: 'a glass of iced tea', indonesianName: 'segelas es teh', price: 3000, priceEnglish: 'three thousand rupiahs', priceIndonesian: 'Rp 3.000', icon: '🍹' },
            { id: 'es_jeruk', englishName: 'a glass of orange juice', indonesianName: 'segelas es jeruk', price: 5000, priceEnglish: 'five thousand rupiahs', priceIndonesian: 'Rp 5.000', icon: '🍊' },
            { id: 'nasi_goreng', englishName: 'a plate of fried rice', indonesianName: 'sepiring nasi goreng', price: 15000, priceEnglish: 'fifteen thousand rupiahs', priceIndonesian: 'Rp 15.000', icon: '🍛' },
            { id: 'air_mineral', englishName: 'a bottle of mineral water', indonesianName: 'sebotol air mineral', price: 4000, priceEnglish: 'four thousand rupiahs', priceIndonesian: 'Rp 4.000', icon: '🍾' },
            { id: 'donat', englishName: 'a piece of donut', indonesianName: 'sepotong donat', price: 2000, priceEnglish: 'two thousand rupiahs', priceIndonesian: 'Rp 2.000', icon: '🍩' },
            { id: 'gado_gado', englishName: 'a plate of gado-gado', indonesianName: 'sepiring gado-gado', price: 10000, priceEnglish: 'ten thousand rupiahs', priceIndonesian: 'Rp 10.000', icon: '🥗' }
        ];

        let state = {
            score: 0,
            stars: 0,
            soundEnabled: true,
            quizIndex: 0,
            quizQuestions: [],
            cashierIndex: 0,
            cashierQuestions: [],
            sentenceIndex: 0,
            sentenceQuestions: [],
            currentSelectedWords: []
        };

        let audioCtx = null;

        function playOfflineSound(type) {
            if (!state.soundEnabled) return;
            try {
                if (!audioCtx) {
                    audioCtx = new (window.AudioContext || window.webkitAudioContext)();
                }

                const now = audioCtx.currentTime;
                const osc = audioCtx.createOscillator();
                const gain = audioCtx.createGain();
                osc.connect(gain);
                gain.connect(audioCtx.destination);

                if (type === 'click') {
                    osc.frequency.setValueAtTime(600, now);
                    gain.gain.setValueAtTime(0.1, now);
                    gain.gain.exponentialRampToValueAtTime(0.001, now + 0.05);
                    osc.start(now);
                    osc.stop(now + 0.05);
                } else if (type === 'correct') {
                    osc.type = 'triangle';
                    osc.frequency.setValueAtTime(523.25, now); // C5
                    osc.frequency.setValueAtTime(659.25, now + 0.1); // E5
                    gain.gain.setValueAtTime(0.15, now);
                    gain.gain.exponentialRampToValueAtTime(0.001, now + 0.3);
                    osc.start(now);
                    osc.stop(now + 0.3);
                } else if (type === 'wrong') {
                    osc.type = 'sawtooth';
                    osc.frequency.setValueAtTime(220, now); // A3
                    osc.frequency.setValueAtTime(174.61, now + 0.1); // F3
                    gain.gain.setValueAtTime(0.15, now);
                    gain.gain.exponentialRampToValueAtTime(0.001, now + 0.25);
                    osc.start(now);
                    osc.stop(now + 0.25);
                } else if (type === 'win') {
                    osc.type = 'sine';
                    osc.frequency.setValueAtTime(523.25, now); // C5
                    osc.frequency.setValueAtTime(659.25, now + 0.1); // E5
                    osc.frequency.setValueAtTime(783.99, now + 0.2); // G5
                    osc.frequency.setValueAtTime(1046.50, now + 0.3); // C6
                    gain.gain.setValueAtTime(0.2, now);
                    gain.gain.exponentialRampToValueAtTime(0.001, now + 0.5);
                    osc.start(now);
                    osc.stop(now + 0.5);
                }
            } catch (e) {
                // Audio fallback
            }
        }

        function toggleSound() {
            state.soundEnabled = !state.soundEnabled;
            document.getElementById('sound-icon-on').classList.toggle('hidden', !state.soundEnabled);
            document.getElementById('sound-icon-off').classList.toggle('hidden', state.soundEnabled);
        }

        function speakEnglishText(text) {
            if ('speechSynthesis' in window) {
                window.speechSynthesis.cancel();
                const utterance = new SpeechSynthesisUtterance(text);
                utterance.lang = 'en-US';
                utterance.rate = 0.85;
                window.speechSynthesis.speak(utterance);
            }
        }

        function switchScreen(screenId) {
            playOfflineSound('click');
            const screens = ['screen-home', 'screen-study', 'screen-quiz', 'screen-cashier', 'screen-sentence', 'screen-result'];
            screens.forEach(id => document.getElementById(id).classList.add('hidden'));
            document.getElementById(screenId).classList.remove('hidden');

            if (screenId === 'screen-study') {
                renderStudyFlashcards();
            }
        }

        function addScore(points, starCount = 1) {
            state.score += points;
            state.stars += starCount;
            document.getElementById('score-count').textContent = state.score;
            document.getElementById('star-count').textContent = state.stars;
        }

        function renderStudyFlashcards() {
            const grid = document.getElementById('flashcards-grid');
            grid.innerHTML = '';

            FOOD_ITEMS.forEach(item => {
                const card = document.createElement('div');
                card.className = 'flashcard';
                card.innerHTML = `
                    <div class="flashcard-top">
                        <div class="flashcard-emoji">${item.icon}</div>
                        <span class="price-pill">${item.priceIndonesian}</span>
                    </div>
                    <div>
                        <div style="display: flex; align-items: center;">
                            <span class="flashcard-title">${item.englishName}</span>
                            <button onclick="speakEnglishText('${item.englishName}')" class="audio-btn">🔊</button>
                        </div>
                        <div class="flashcard-sub">${item.indonesianName}</div>
                    </div>
                    <div class="flashcard-footer">
                        <div style="color: #94a3b8; font-weight: 800; font-size: 0.65rem;">HARGA (ENGLISH):</div>
                        <div style="display: flex; align-items: center; justify-content: space-between; margin-top: 2px;">
                            <strong style="color: #059669; font-size: 0.8rem;">${item.priceEnglish}</strong>
                            <button onclick="speakEnglishText('${item.priceEnglish}')" style="background:none; border:none; cursor:pointer;">🔊</button>
                        </div>
                    </div>
                `;
                grid.appendChild(card);
            });
        }

        function startQuizMode() {
            const shuffled = [...FOOD_ITEMS].sort(() => 0.5 - Math.random());
            state.quizQuestions = shuffled.slice(0, 5);
            state.quizIndex = 0;
            switchScreen('screen-quiz');
            loadQuizQuestion();
        }

        function loadQuizQuestion() {
            const currentItem = state.quizQuestions[state.quizIndex];
            document.getElementById('quiz-current-num').textContent = state.quizIndex + 1;
            document.getElementById('quiz-total-num').textContent = state.quizQuestions.length;
            document.getElementById('quiz-progress').style.width = `${((state.quizIndex + 1) / state.quizQuestions.length) * 100}%`;
            document.getElementById('quiz-feedback').innerHTML = '';
            document.getElementById('quiz-target-text').textContent = `"${currentItem.englishName}"`;

            let choices = [currentItem];
            const remaining = FOOD_ITEMS.filter(item => item.id !== currentItem.id);
            const wrongChoices = remaining.sort(() => 0.5 - Math.random()).slice(0, 3);
            choices = choices.concat(wrongChoices).sort(() => 0.5 - Math.random());

            const container = document.getElementById('quiz-options-container');
            container.innerHTML = '';

            choices.forEach(choice => {
                const btn = document.createElement('button');
                btn.className = 'option-btn';
                btn.innerHTML = `
                    <span style="font-size: 2.8rem;">${choice.icon}</span>
                    <span>${choice.indonesianName}</span>
                `;
                btn.onclick = () => checkQuizAnswer(choice, currentItem, btn);
                container.appendChild(btn);
            });

            speakEnglishText(currentItem.englishName);
        }

        function speakCurrentQuestion() {
            const currentItem = state.quizQuestions[state.quizIndex];
            if (currentItem) speakEnglishText(currentItem.englishName);
        }

        function checkQuizAnswer(selected, correct, element) {
            const feedback = document.getElementById('quiz-feedback');
            document.querySelectorAll('#quiz-options-container button').forEach(b => b.disabled = true);

            if (selected.id === correct.id) {
                playOfflineSound('correct');
                element.classList.add('correct');
                feedback.innerHTML = `<span class="text-emerald">✔ Great job! Benar sekali! (+20 Poin)</span>`;
                addScore(20, 1);

                setTimeout(() => {
                    state.quizIndex++;
                    if (state.quizIndex < state.quizQuestions.length) loadQuizQuestion();
                    else startCashierMode();
                }, 1300);
            } else {
                playOfflineSound('wrong');
                element.classList.add('wrong');
                feedback.innerHTML = `<span class="text-rose">✖ Kurang tepat! Jawaban benar: <strong>${correct.indonesianName}</strong></span>`;

                setTimeout(() => {
                    state.quizIndex++;
                    if (state.quizIndex < state.quizQuestions.length) loadQuizQuestion();
                    else startCashierMode();
                }, 1800);
            }
        }

        function startCashierMode() {
            const shuffled = [...FOOD_ITEMS].sort(() => 0.5 - Math.random());
            state.cashierQuestions = shuffled.slice(0, 5);
            state.cashierIndex = 0;
            switchScreen('screen-cashier');
            loadCashierQuestion();
        }

        function loadCashierQuestion() {
            const currentItem = state.cashierQuestions[state.cashierIndex];
            document.getElementById('cashier-feedback').innerHTML = '';

            const questionText = `Excuse me, how much is ${currentItem.englishName}?`;
            document.getElementById('cashier-dialogue').textContent = `"${questionText}"`;

            const visual = document.getElementById('cashier-order-visual');
            visual.innerHTML = `
                <span style="font-size: 3.5rem;">${currentItem.icon}</span>
                <span style="font-weight: 800; font-size: 0.9rem; margin-top: 0.3rem;">${currentItem.englishName}</span>
                <span class="price-pill" style="margin-top: 0.3rem;">${currentItem.priceIndonesian}</span>
            `;

            let choices = [currentItem.priceEnglish];
            const otherPrices = FOOD_ITEMS.filter(f => f.priceEnglish !== currentItem.priceEnglish).map(f => f.priceEnglish);
            const uniquePrices = [...new Set(otherPrices)].sort(() => 0.5 - Math.random()).slice(0, 3);
            choices = choices.concat(uniquePrices).sort(() => 0.5 - Math.random());

            const container = document.getElementById('cashier-options-container');
            container.innerHTML = '';

            choices.forEach(priceEng => {
                const btn = document.createElement('button');
                btn.className = 'option-btn';
                btn.style.flexDirection = 'row';
                btn.style.justifyContent = 'space-between';
                btn.style.padding = '0.85rem 1.25rem';
                btn.innerHTML = `
                    <span style="text-transform: capitalize;">It is ${priceEng}.</span>
                    <span>&rarr;</span>
                `;
                btn.onclick = () => checkCashierAnswer(priceEng, currentItem.priceEnglish, btn);
                container.appendChild(btn);
            });

            speakEnglishText(questionText);
        }

        function speakCashierDialogue() {
            const currentItem = state.cashierQuestions[state.cashierIndex];
            if (currentItem) speakEnglishText(`Excuse me, how much is ${currentItem.englishName}?`);
        }

        function checkCashierAnswer(selectedPrice, correctPrice, btn) {
            const feedback = document.getElementById('cashier-feedback');
            document.querySelectorAll('#cashier-options-container button').forEach(b => b.disabled = true);

            if (selectedPrice === correctPrice) {
                playOfflineSound('correct');
                btn.classList.add('correct');
                feedback.innerHTML = `<span class="text-emerald">✔ Excellent! Total harganya tepat! (+20 Poin)</span>`;
                addScore(20, 1);

                setTimeout(() => {
                    state.cashierIndex++;
                    if (state.cashierIndex < state.cashierQuestions.length) loadCashierQuestion();
                    else startSentenceMode();
                }, 1300);
            } else {
                playOfflineSound('wrong');
                btn.classList.add('wrong');
                feedback.innerHTML = `<span class="text-rose">✖ Kurang tepat. Yang benar: <strong>It is ${correctPrice}.</strong></span>`;

                setTimeout(() => {
                    state.cashierIndex++;
                    if (state.cashierIndex < state.cashierQuestions.length) loadCashierQuestion();
                    else startSentenceMode();
                }, 1800);
            }
        }

        function startSentenceMode() {
            state.sentenceQuestions = [
                { indonesian: "Semangkok bakso harganya sepuluh ribu rupiah.", words: ["A", "bowl", "of", "bakso", "is", "ten", "thousand", "rupiahs."], correct: "A bowl of bakso is ten thousand rupiahs." },
                { indonesian: "Berapa harga segelas es teh?", words: ["How", "much", "is", "a", "glass", "of", "iced", "tea?"], correct: "How much is a glass of iced tea?" },
                { indonesian: "Sepiring nasi goreng harganya lima belas ribu rupiah.", words: ["A", "plate", "of", "fried", "rice", "is", "fifteen", "thousand", "rupiahs."], correct: "A plate of fried rice is fifteen thousand rupiahs." },
                { indonesian: "Segelas es jeruk harganya lima ribu rupiah.", words: ["A", "glass", "of", "orange", "juice", "is", "five", "thousand", "rupiahs."], correct: "A glass of orange juice is five thousand rupiahs." },
                { indonesian: "Semangkok mie ayam harganya dua belas ribu rupiah.", words: ["A", "bowl", "of", "mie", "ayam", "is", "twelve", "thousand", "rupiahs."], correct: "A bowl of mie ayam is twelve thousand rupiahs." }
            ];

            state.sentenceIndex = 0;
            switchScreen('screen-sentence');
            loadSentenceQuestion();
        }

        function loadSentenceQuestion() {
            const currentQ = state.sentenceQuestions[state.sentenceIndex];
            document.getElementById('sentence-translation').textContent = `"${currentQ.indonesian}"`;
            document.getElementById('sentence-feedback').innerHTML = '';

            state.currentSelectedWords = [];
            renderSentenceSlots();

            const shuffledWords = [...currentQ.words].sort(() => 0.5 - Math.random());
            const wordbank = document.getElementById('sentence-wordbank');
            wordbank.innerHTML = '';

            shuffledWords.forEach((word) => {
                const card = document.createElement('button');
                card.className = 'word-card';
                card.textContent = word;
                card.onclick = () => selectWord(word, card);
                wordbank.appendChild(card);
            });
        }

        function selectWord(word, cardElement) {
            playOfflineSound('click');
            state.currentSelectedWords.push({ word, element: cardElement });
            cardElement.classList.add('disabled');
            renderSentenceSlots();
        }

        function deselectWord(index) {
            playOfflineSound('click');
            const removed = state.currentSelectedWords.splice(index, 1)[0];
            if (removed && removed.element) {
                removed.element.classList.remove('disabled');
            }
            renderSentenceSlots();
        }

        function renderSentenceSlots() {
            const slots = document.getElementById('sentence-slots');
            slots.innerHTML = '';

            if (state.currentSelectedWords.length === 0) {
                slots.innerHTML = `<span style="color: #94a3b8; font-size: 0.8rem; font-style: italic;">Klik kata di bawah untuk mengisi di sini...</span>`;
                return;
            }

            state.currentSelectedWords.forEach((item, index) => {
                const chip = document.createElement('button');
                chip.className = 'word-chip';
                chip.innerHTML = `<span>${item.word}</span> <span>✕</span>`;
                chip.onclick = () => deselectWord(index);
                slots.appendChild(chip);
            });
        }

        function resetSentenceSlots() {
            playOfflineSound('click');
            state.currentSelectedWords.forEach(item => {
                if (item.element) item.element.classList.remove('disabled');
            });
            state.currentSelectedWords = [];
            renderSentenceSlots();
        }

        function checkSentenceAnswer() {
            const currentQ = state.sentenceQuestions[state.sentenceIndex];
            const userSentence = state.currentSelectedWords.map(w => w.word).join(' ');
            const feedback = document.getElementById('sentence-feedback');

            if (userSentence === currentQ.correct) {
                playOfflineSound('correct');
                speakEnglishText(currentQ.correct);
                feedback.innerHTML = `<span class="text-emerald">✔ Kalimat Sempurna! Perfect! (+20 Poin)</span>`;
                addScore(20, 1);

                setTimeout(() => {
                    state.sentenceIndex++;
                    if (state.sentenceIndex < state.sentenceQuestions.length) loadSentenceQuestion();
                    else finishAllGames();
                }, 1500);
            } else {
                playOfflineSound('wrong');
                feedback.innerHTML = `<span class="text-rose">✖ Susunan belum tepat. Coba periksa urutan kata!</span>`;
            }
        }

        function finishAllGames() {
            playOfflineSound('win');
            switchScreen('screen-result');

            document.getElementById('final-score').textContent = state.score;
            document.getElementById('final-stars').textContent = `⭐ ${state.stars}`;

            triggerOfflineConfetti();
        }

        function triggerOfflineConfetti() {
            const canvas = document.getElementById('confetti-canvas');
            const ctx = canvas.getContext('2d');
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;

            const particles = [];
            const colors = ['#f59e0b', '#059669', '#6366f1', '#f43f5e', '#3b82f6'];

            for (let i = 0; i < 80; i++) {
                particles.push({
                    x: canvas.width / 2,
                    y: canvas.height / 2,
                    vx: (Math.random() - 0.5) * 12,
                    vy: (Math.random() - 0.7) * 12,
                    size: Math.random() * 8 + 4,
                    color: colors[Math.floor(Math.random() * colors.length)],
                    life: 100
                });
            }

            function animateConfetti() {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                let alive = false;

                particles.forEach(p => {
                    if (p.life > 0) {
                        alive = true;
                        p.x += p.vx;
                        p.y += p.vy;
                        p.vy += 0.2; // gravity
                        p.life--;

                        ctx.fillStyle = p.color;
                        ctx.fillRect(p.x, p.y, p.size, p.size);
                    }
                });

                if (alive) requestAnimationFrame(animateConfetti);
            }

            animateConfetti();
        }

        window.onload = function() {
            renderStudyFlashcards();
        };
    </script>
</body>
</html>
