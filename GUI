import tkinter as tk
from function import trigonomtric,anti_trigonomtric


class TrigonometricCalculatorLogic:
    def __init__(self):
        pass

    def calculate_trig(self, func, angle):
        try:
            angle = float(angle)
            if func == "sin":
                result = trigonomtric.my_sin(angle)
            elif func == "cos":
                result = trigonomtric.my_cos(angle)
            elif func == "tan":
                result = trigonomtric.my_tan(angle)
            elif func == "arcsin":
                result = anti_trigonomtric.my_arcsin(angle)
            elif func == "arccos":
                result = anti_trigonomtric.my_arccos(angle)
            elif func == "arctan":
                result = anti_trigonomtric.my_arctan(angle)
            return str(result)
        except ValueError:
            return "请输入有效数字"


class TrigonometricCalculatorUI:
    def __init__(self, root):
        self.root = root
        self.root.title("三角函数计算器")
        self.root.configure(bg="#f0f0f0")

        self.logic = TrigonometricCalculatorLogic()

        # 创建角度输入框和标签
        self.angle_label = tk.Label(self.root, text="角度", bg="#f0f0f0")
        self.angle_label.grid(row=0, column=0, padx=10, pady=10, sticky=tk.W)

        self.angle_entry = tk.Entry(self.root, width=20)
        self.angle_entry.grid(row=0, column=1, padx=10, pady=10)

        # 创建清除按钮
        self.clear_button = tk.Button(self.root, text="清除", command=self.clear, bg="#d9534f", fg="white", width=10)
        self.clear_button.grid(row=0, column=2, padx=10, pady=10, sticky=tk.W)

        # 创建三角函数计算按钮
        self.create_trig_buttons()

        # 创建结果显示框和标签
        self.result_label = tk.Label(self.root, text="结果", bg="#f0f0f0")
        self.result_label.grid(row=1, column=0, padx=10, pady=10, sticky=tk.W)

        self.result_entry = tk.Entry(self.root, width=20)
        self.result_entry.grid(row=1, column=1, padx=10, pady=10)

    def create_trig_buttons(self):
        trig_funcs = ["sin", "cos", "tan", "arcsin", "arccos", "arctan"]

        for idx, func in enumerate(trig_funcs):
            if idx < 3:
                button_row = 2
            else:
                button_row = 3

            button = tk.Button(self.root, text=func, command=lambda f=func: self.trig_button_clicked(f), bg="#00994C",
                               fg="white", width=8)
            button.grid(row=button_row, column=idx % 3, padx=5, pady=5, sticky=tk.EW)

    def clear(self):
        self.angle_entry.delete(0, tk.END)
        self.result_entry.delete(0, tk.END)

    def trig_button_clicked(self, func):
        angle = self.angle_entry.get()
        result = self.logic.calculate_trig(func, angle)
        self.result_entry.delete(0, tk.END)
        self.result_entry.insert(0, result)


if __name__ == "__main__":
    root = tk.Tk()
    app = TrigonometricCalculatorUI(root)
    root.mainloop()
