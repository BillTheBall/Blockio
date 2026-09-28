keeb = {}

local At = 0
local Bt = 0
local Ct = 0
local Dt = 0
local Et = 0
local Ft = 0
local Gt = 0
local Ht = 0
local It = 0
local Jt = 0
local Kt = 0
local Lt = 0
local Mt = 0
local Nt = 0
local Ot = 0
local Pt = 0
local Qt = 0
local Rt = 0
local St = 0
local Tt = 0
local Ut = 0
local Vt = 0
local Wt = 0
local Xt = 0
local Yt = 0
local Zt = 0
local Spacet = 0
local ASquigglet = 0
local A1t = 0
local A2t = 0
local A3t = 0
local A4t = 0
local A5t = 0
local A6t = 0
local A7t = 0
local A8t = 0
local A9t = 0
local A0t = 0
local AMinust = 0
local AEqualt = 0
local ARBrackt = 0
local ALBrackt = 0
local ABackslasht = 0
local ASemit = 0
local AQuotest = 0
local ACommat = 0
local APeriodt = 0
local AFrontSlasht = 0
local Esct = 0
local Upt = 0
local Rightt = 0
local Leftt = 0
local Downt = 0

function keeb:load()
    A = false
    B = false
    C = false
    D = false
    E = false
    F = false
    G = false
    H = false
    I = false
    J = false
    K = false
    L = false
    M = false
    N = false
    O = false
    P = false
    Q = false
    R = false
    S = false
    T = false
    U = false
    V = false
    W = false
    X = false
    Y = false
    Z = false
    Space = false
    ASquiggle = false
    A1 = false
    A2 = false
    A3 = false
    A4 = false
    A5 = false
    A6 = false
    A7 = false
    A8 = false
    A9 = false
    A0 = false
    AMinus = false
    AEqual = false
    ARBrack = false
    ALBrack = false
    ABackslash = false
    ASemi = false
    AQuotes = false
    AComma = false
    APeriod = false
    AFrontSlash = false
    Esc = false
    Up = false
    Down = false
    Left = false
    Right = false
end

function keeb:update(dt)
    if A1t > 0 then
        A1 = false
    end
    if A1 then
        A1t = A1t + dt
    end
    if A2t > 0 then
        A2 = false
    end
    if A2 then
        A2t = A2t + dt
    end
    if A3t > 0 then
        A3 = false
    end
    if A3 then
        A3t = A3t + dt
    end
    if A4t > 0 then
        A4 = false
    end
    if A4 then
        A4t = A4t + dt
    end
    if A5t > 0 then
        A5 = false
    end
    if A5 then
        A5t = A5t + dt
    end
    if A6t > 0 then
        A6 = false
    end
    if A6 then
        A6t = A6t + dt
    end
    if A7t > 0 then
        A7 = false
    end
    if A7 then
        A7t = A7t + dt
    end
    if A8t > 0 then
        A8 = false
    end
    if A8 then
        A8t = A8t + dt
    end
    if A9t > 0 then
        A9 = false
    end
    if A9 then
        A9t = A9t + dt
    end
    if A0t > 0 then
        A0 = false
    end
    if A0 then
        A0t = A0t + dt
    end



    if Esct > 0 then
        Esc = false
    end
    if Esc then
        Esct = Esct + dt
    end



    if AMinust > 0 then
        AMinus = false
    end
    if AMinus then
        AMinust = AMinust + dt
    end
    if AEqualt > 0 then
        AEqual = false
    end
    if AEqual then
        AEqualt = AEqualt + dt
    end
    if ALBrackt > 0 then
        ALBrack = false
    end
    if ALBrack then
        ALBrackt = ALBrackt + dt
    end
    if ARBrackt > 0 then
        ARBrack = false
    end
    if ARBrack then
        ARBrackt = ARBrackt + dt
    end
    if ABackslasht > 0 then
        ABackslash = false
    end
    if ABackslash then
        ABackslasht = ABackslasht + dt
    end
    if AFrontSlasht > 0 then
        AFrontSlash = false
    end
    if AFrontSlash then
        AFrontSlasht = AFrontSlasht + dt
    end
    if ASemit > 0 then
        ASemi = false
    end
    if ASemi then
        ASemit = ASemit + dt
    end
    if AQuotest > 0 then
        AQuotes = false
    end
    if AQuotes then
        AQuotest = AQuotest + dt
    end
    if ACommat > 0 then
        AComma = false
    end
    if AComma then
        ACommat = ACommat + dt
    end
    if APeriodt > 0 then
        APeriod = false
    end
    if APeriod then
        APeriodt = APeriodt + dt
    end
    if ASquigglet > 0 then
        ASquiggle = false
    end
    if ASquiggle then
        ASquigglet = ASquigglet + dt
    end



    if At > 0 then
        A = false
    end
    if A then
        At = At + dt
    end
    if Bt > 0 then
        B = false
    end
    if B then
        Bt = Bt + dt
    end
    if Ct > 0 then
        C = false
    end
    if C then
        Ct = Ct + dt
    end
    if Dt > 0 then
        D = false
    end
    if D then
        Dt = Dt + dt
    end
    if Et > 0 then
        E = false
    end
    if E then
        Et = Et + dt
    end
    if Ft > 0 then
        F = false
    end
    if F then
        Ft = Ft + dt
    end
    if Gt > 0 then
        G = false
    end
    if G then
        Gt = Gt + dt
    end
    if Ht > 0 then
        H = false
    end
    if H then
        Ht = Ht + dt
    end
    if It > 0 then
        I = false
    end
    if I then
        It = It + dt
    end
    if Jt > 0 then
        J = false
    end
    if J then
        Jt = Jt + dt
    end
    if Kt > 0 then
        K = false
    end
    if K then
        Kt = Kt + dt
    end
    if Lt > 0 then
        L = false
    end
    if L then
        Lt = Lt + dt
    end
    if Mt > 0 then
        M = false
    end
    if M then
        Mt = Mt + dt
    end
    if Nt > 0 then
        N = false
    end
    if N then
        Nt = Nt + dt
    end
    if Ot > 0 then
        O = false
    end
    if O then
        Ot = Ot + dt
    end
    if Pt > 0 then
        P = false
    end
    if P then
        Pt = Pt + dt
    end
    if Qt > 0 then
        Q = false
    end
    if Q then
        Qt = Qt + dt
    end
    if Rt > 0 then
        R = false
    end
    if R then
        Rt = Rt + dt
    end
    if St > 0 then
        S = false
    end
    if S then
        St = St + dt
    end
    if Tt > 0 then
        T = false
    end
    if T then
        Tt = Tt + dt
    end
    if Ut > 0 then
        U = false
    end
    if U then
        Ut = Ut + dt
    end
    if Vt > 0 then
        V = false
    end
    if V then
        Vt = Vt + dt
    end
    if Wt > 0 then
        W = false
    end
    if W then
        Wt = Wt + dt
    end
    if Xt > 0 then
        X = false
    end
    if X then
        Xt = Xt + dt
    end
    if Yt > 0 then
        Y = false
    end
    if Y then
        Yt = Yt + dt
    end
    if Z then
        Zt = Zt + dt
    end
    if Zt > 0 then
        Z = false
    end

    if Upt > 0 then
        Up = false
    end
    if Up then
        Upt = Upt + dt
    end
    if Downt > 0 then
        Down = false
    end
    if Down then
        Downt = Downt + dt
    end
    if Leftt > 0 then
        Left = false
    end
    if Left then
        Leftt = Leftt + dt
    end
    if Rightt > 0 then
        Right = false
    end
    if Right then
        Rightt = Rightt + dt
    end
    if Space then
        Spacet = Spacet + dt
    end
    if Spacet > 0 then
        Z = false
    end
end

function love.keypressed(key, scancode, isrepeat)
    if key == "1" and not A1 then
        A1 = true
        A1t = 0
    end
    if key == "2" and not A2 then
        A2 = true
        A2t = 0
    end
    if key == "3" and not A3 then
        A3 = true
        A3t = 0
    end
    if key == "4" and not A4 then
        A4 = true
        A4t = 0
    end
    if key == "5" and not A5 then
        A5 = true
        A5t = 0
    end
    if key == "6" and not A6 then
        A6 = true
        A6t = 0
    end
    if key == "7" and not A7 then
        A7 = true
        A7t = 0
    end
    if key == "8" and not A8 then
        A8 = true
        A8t = 0
    end
    if key == "9" and not A9 then
        A9 = true
        A9t = 0
    end
    if key == "0" and not A0 then
        A0 = true
        A0t = 0
    end



    if key == "escape" and not Esc then
        Esc = true
        Esct = 0
    end



    if key == "-" and not AMinus then
        AMinus = true
        AMinust = 0
    end
    if key == "=" and not AEqual then
        AEqual = true
        AEqualt = 0
    end
    if key == "[" and not ALBrack then
        ALBrack = true
        ALBrackt = 0
    end
    if key == "]" and not ARBrack then
        ARBrack = true
        ARBrackt = 0
    end
    if key == ";" and not ASemi then
        ASemi = true
        ASemit = 0
    end
    if key == "'" and not AQuotes then
        AQuotes = true
        AQuotest = 0
    end
    if key == "," and not AComma then
        AComma = true
        ACommat = 0
    end
    if key == "." and not APeriod then
        APeriod = true
        APeriodt = 0
    end
    if key == "/" and not AFrontSlash then
        AFrontSlash = true
        AFrontSlasht = 0
    end
    if key == "`" and not ASquiggle then
        ASquiggle = true
        ASquigglet = 0
    end

    if key == "a" and not A then
        A = true
        At = 0
    end
    if key == "b" and not B then
        B = true
        Bt = 0
    end
    if key == "c" and not C then
        C = true
        Ct = 0
    end
    if key == "d" and not D then
        D = true
        Dt = 0
    end
    if key == "e" and not E then
        E = true
        Et = 0
    end
    if key == "f" and not F then
        F = true
        Ft = 0
    end
    if key == "g" and not G then
        G = true
        Gt = 0
    end
    if key == "h" and not H then
        H = true
        Ht = 0
    end
    if key == "i" and not I then
        I = true
        It = 0
    end
    if key == "j" and not J then
        J = true
        Jt = 0
    end
    if key == "k" and not K then
        K = true
        Kt = 0
    end
    if key == "l" and not L then
        L = true
        Lt = 0
    end
    if key == "m" and not M then
        M = true
        Mt = 0
    end
    if key == "n" and not N then
        N = true
        Nt = 0
    end
    if key == "o" and not O then
        O = true
        Ot = 0
    end
    if key == "p" and not P then
        P = true
        Pt = 0
    end
    if key == "q" and not Q then
        Q = true
        Qt = 0
    end
    if key == "r" and not R then
        R = true
        Rt = 0
    end
    if key == "s" and not S then
        S = true
        St = 0
    end
    if key == "t" and not T then
        T = true
        Tt = 0
    end
    if key == "u" and not U then
        U = true
        Ut = 0
    end
    if key == "v" and not V then
        V = true
        Vt = 0
    end
    if key == "w" and not W then
        W = true
        Wt = 0
    end
    if key == "x" and not X then
        X = true
        Xt = 0
    end
    if key == "y" and not Y then
        Y = true
        Yt = 0
    end
    if key == "z" and not Z then
        Z = true
        Zt = 0
    end

    if key == "up" and not Up then
        Up = true
        Upt = 0
    end
    if key == "down" and not Down then
        Down = true
        Downt = 0
    end
    if key == "left" and not Left then
        Left = true
        Leftt = 0
    end
    if key == "right" and not Right then
        Right = true
        Rightt = 0
    end


    if key == "space" and not Space then
        Space = true
        Spacet = 0
    end
end
